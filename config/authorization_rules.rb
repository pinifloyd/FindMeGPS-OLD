authorization do

  role :guest do
    has_permission_on :welcome,       to: :index
    has_permission_on :user_sessions, to: :create
    has_permission_on :users,         to: :create
  end

  role :user do
    has_permission_on :welcome,       to: :index
    has_permission_on :user_sessions, to: :delete
    has_permission_on :users,         to: [ :show, :update ] do
      if_attribute id: is { user.id }
    end
  end

  role :operator do
    includes :user
    has_permission_on :maps, to: :show
  end

  role :admin do
    has_omnipotence
  end
end

privileges do
  # Default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, includes: [ :create, :read, :update, :delete ]
  privilege :read,   includes: [ :index, :show ]
  privilege :create, includes: :new
  privilege :update, includes: :edit
  privilege :delete, includes: :destroy
end
