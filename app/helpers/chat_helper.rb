module ChatHelper
  def get_messages(reciever)
    output=[]
    mess=Massage.joins("INNER JOIN chat_users ON chat_users.id = massages.reseiver_id").where('chat_users.login = ?', reciever)
    for i in 0...mess.size
      login=mess[i].sender.login
      body=mess[i].body
      json={}
      json['name']=login
      json['message']=body
      output.push(json.to_json)
      Massage.destroy(mess[i].id)
    end

    broadcast_messages=$redis.lrange('broadcast', 0, -1)
    broadcast_messages.each do |br_message|
      br_message_array=br_message.split(':')
      login=br_message_array[0]
      br_m=br_message_array[1]
      json={}
      json['name']=login
      json['message']=br_m
      output.push(json.to_json)
    end
    output
  end

  def save_message(sender,reciever,message)
    s=ChatUser.find_by_login(sender)
    rs=ChatUser.find_by_login(reciever)
    m=Massage.new(body: message, sender: s, reciever: rs)
    m.save
  end

  def save_broadcast_message(sender, message)
    $redis.lpush('broadcast', sender+':'+message)
  end
end
