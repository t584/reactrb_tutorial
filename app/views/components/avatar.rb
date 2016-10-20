class Avatar < React::Component::Base
  param :user_name#, default: "Tony"
  def render
    div do
      ProfilePic1 user_name: params.user_name
      ProfileLink user_name: params.user_name
    end
  end
end

class ProfileLink < React::Component::Base
  param :user_name
  def render
    div { "ProfileLink - #{params.user_name}" }
  end
end

class ProfilePic1 < React::Component::Base
  param :user_name
  def render
    div do
      div { "ProfilePic1 - #{params.user_name}" }
      ProfilePic2  user_name: params.user_name
    end
  end
end

class ProfilePic2 < React::Component::Base
  param :user_name
  def render
    div do
      div { "ProfilePic2 - #{params.user_name}" }
      ProfilePic3  user_name: params.user_name
    end
  end
end

class ProfilePic3 < React::Component::Base
  param :user_name
  def render
    div do
      div { "ProfilePic3 - #{params.user_name}" }
      ProfilePic4  user_name: params.user_name
    end
  end
end

class ProfilePic4 < React::Component::Base
  param :user_name
  def render
    div do
      div { params.user_name }
      ProfilePic5  user_name: params.user_name
    end
  end
end

class ProfilePic5 < React::Component::Base
  def render
    div { 'ProfilePic5' }
  end
end
