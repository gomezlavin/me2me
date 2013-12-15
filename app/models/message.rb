class Message < ActiveRecord::Base
  attr_accessible :title, :idea, :delivery_date, :delivery_time, :last_sent, :times_sent

  belongs_to :user
  has_many :message_tags
  has_many :tags, through: :message_tags

  # Method that returns the users' tags
  def self.getMessagesTags(current_user)
    result = []
    tag_array = []

    u = User.find_by_id(current_user.id)
    m = u.messages.all

    m.each do |msg|
      msg.tags.each do |tag|
        tag_array << tag.word
      end
    end
    tag_array.sort!.uniq!
    result[0] = m
    result[1] = tag_array
    return result
  end

  # Method to add a new message to the user's DB
  # Adds random delivery date and time
  # Returns users' tags
  def self.addMessage(params,current_user)
    all_tags = []
    date = getRandomDate()
    time = getRandomTime()
    u = User.find_by_id(current_user.id)
    m = Message.create(
      title: params[:title],
      idea: params[:idea],
      delivery_date: date,
      delivery_time: time)

    params[:tags].each do |f|
      t = Tag.create(word: f)
      m.tags << t
    end
    u.messages << m
    m = u.messages.all
    m.each do |msg|
      msg.tags.each do |tag|
        all_tags << tag.word
      end
    end
    all_tags.sort!.uniq!
    return all_tags
  end

  # Define a random date within 180 days which has not been taken
  def self.getRandomDate()
    rand = [*1..180].sample
    date = Time.now + (rand*24*60*60)
    date = date.strftime("%Y-%m-%d")
    while (Message.where(delivery_date: date) != [])
      rand = [*1..180].sample
      date = Time.now + (rand*24*60*60)
      date = date.strftime("%Y-%m-%d")
    end
    return date
  end

  # Define a random time of day between 10am and 6pm
  def self.getRandomTime()
    rand = [*1..28800].sample
    time_ini = Time.now.change({hour: 10, min: 0 , sec: 0 })
    time = time_ini + rand
    time = time.strftime("%H:%M:%S")
    return time
  end

  # Method that returns messages with a specific tag
  def self.getTaggedMessages(params,current_user)
    u = User.find_by_id(current_user.id)
    m = u.messages.includes(:tags).where("tags.word = '#{params[:tag]}'")
    return m
  end

  # Method that returns messages that match a specific keyword
  def self.searchMessages(params,current_user)
    unified_array = []
    u = User.find_by_id(current_user.id)
    t = u.messages.find :all, :conditions => ["title LIKE?", "%#{params[:search]}%"]
    i = u.messages.find :all, :conditions => ["idea LIKE?", "%#{params[:search]}%"]
    t.each { |element| unified_array << element }
    i.each { |element| unified_array << element }
    unified_array = unified_array.sort!.uniq
    return unified_array
  end

end
