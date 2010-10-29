class SignupController < ApplicationController
  def index
    event_key = params[:id] || session[:event]
    logger.debug(event_key)
    if Event.exists?(:key => event_key)
      @event = Event.find_by_key(event_key)
      session[:event] = @event.key
      @contributor = Contributor.new
      @selections = Hash.new
    else
      render :action => "not_found"
    end
  end
  
  def create
    # Make sure we know which event we are working with
    render :action => "not_found" unless session[:event]
    # Protect from direct creates
    if request.get? 
      redirect_to :action => "index", :id => session[:event]
      return
    end

    # Verify event
    @event = Event.find_by_key(session[:event])
    # Setup objects
    @contributor = Contributor.new(params[:contributor])
    # Validate request
    @contributor.name.empty? and @event.errors.add_to_base 'Please enter your name.'
    if @contributor.email.empty?
      @event.errors.add_to_base 'Please enter your email.'
    else
      unless @contributor.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
        @event.errors.add_to_base 'Please enter a valid email.'
      end
    end
    
    count = 0
    params[:contributions].each do |item_id, data|
      unless data[:quantity].nil? or data[:quantity].empty?
        unless data[:quantity].to_i >= 0
          i = Item.find(item_id, :conditions => "event_id = #{@event.id}")
          @event.errors.add_to_base 'The quantity for "' + i.name + '" seems invalid.'
        else
          count += data[:quantity].to_i
        end
      end
    end
    
    count == 0 and @event.errors.add_to_base 'Please signup for an item.'
    
    # Save selections
    @selections = params[:contributions]    
    
    if @event.errors.empty?
      # Verify event
      @event = Event.find_by_key(session[:event])
      # Create contributor
      @contributor = Contributor.new(params[:contributor])
      # Setup messages
      @messages = {:warning => [], :general => []}
      # Create contributions
      params[:contributions].each do |item_id, data|
        if Item.exists?(:id => item_id, :event_id => @event.id)
          @item = Item.find(item_id)
          unless data[:quantity].nil? or data[:quantity].to_i < 1
            # If there is a quantity for an item, let's see how many are needed now:  
            if @item.remaining_count > 0
              if @item.remaining_count < data[:quantity].to_i
                qty = @item.remaining_count
                tmp = "You signed up for #{data[:quantity]} #{@item.name.pluralize}, but only #{qty} were needed by the time you sent your request, so you are only responsible for #{qty} #{@item.name.pluralize}"
                tmp += " (Note to organizer: <em>#{data[:note]})</em>" if data.has_key?(:note)
                @messages[:warning] << tmp
              else
                qty = data[:quantity]
              end
              @item.contributions << Contribution.new(:contributor => @contributor, :quantity => qty, :note => data[:note])
              tmp = "#{qty} #{@item.name.pluralize}"
              tmp += " (Note to organizer: \"#{data[:note]}\")" if data.has_key?(:note)
              @messages[:general] << tmp
            else
              @messages[:warning] << "Someone had just signed up for #{@item.name}, feel free to signup for other items instead."
            end
          end
        end
      end
      unless @messages[:general].empty?
        NotificationMailer.deliver_signup(@event, @contributor, @messages[:general])
        #email = NotificationMailer.create_signup(@event, @contributor, @messages[:general]) 
        #logger.debug(email.encoded)
      end
      #redirect_to :action => "index", :id => session[:event]
      render :action => 'thanks'
    else
      render :action => 'index'
    end
    
  end
end
