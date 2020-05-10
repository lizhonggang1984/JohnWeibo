# Zhonggang_Rails_Weibo
This is my blog based on rails on rack. 
Versions:
(1) rails: Rails 6.0.3
(2) ruby： ruby 2.6.5p114 
(3) gem: 3.0.6


To open blog:   localhost:3000  

can choose (1) show all content  (2) show recent content  (3) edit blog  (4) admin  (5)  login


Following are the steps to set up my weibo blog: 

MVC design for a weibo

1. $rails new weibo  ( or using --skip-bundle and then bundle install)
2. // $rails generate controller posts create index new show (rails destroy controller welcome)
3.  config/routes.rb   add --------    root 'posts#index'  (check whether above actions are listed 	as get xxx , like   get 'posts/index')
    if -d=mysql
     need to set up  conf/database.yml  file
4. // $rake routes  (check the set up routes /posts/index, /posts/new, /posts/create and /posts/show)
5. // best way is to set up "resources :posts" in routes.rb
6. // $rake routes (double check the set up routes is successful)
7. // delete "resources :posts" in routes.rb  (keep root 'posts#index'  in routes.rb)
8. // $rails destroy controller posts
9. $rails generate scaffold Post content:text
10.$bundle exec rake db:migrate  (rake db:rollback)
11.$rails server

for index page using:  using href

	<h1>Welcome to User Administration System</h1>
	<br>

	<a href = "/users/content" ///// > Users Info</a>
	<br>
	<a href = "/users/admin"  /////> User Admin</a>



12. go to app/views/posts  add "recent.html.erb"  file and  edit it
13. conf/routes.rb  add following to resource route

  resources :posts///// do
    collection do
      get 'recent'////
      get 'showpost'////
      get 'xxx'
    end	
  end

14. go to app/controller  edit post_controller   put
	IF YOU WANT THE RECENT TO ACCESS TO post
	  # GET /posts/recent
  def recent////
    @posts = Post.all    
  end

15.  $rails server



add model
16. $rails generate model user username:string email:string

17.$bundle exec rake db:migrate  (rake db:rollback)
18. $rails console   (control model)
>>>  @user = User.new(:username => 'john', :email => 'lizhonggang80@gmail.com')
>>>  @user.save
>>>  User.find(1)     /// or User.all

19.  models/user.rb   add this to validate
	class User < ApplicationRecord

	validates(:username, presence: true, length: {maximun: 20, minimum: 2},uniqueness: true)
	EMAILFORMAT = /\A[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence: true, length: {maximun: 50, minimum: 5}, format: {with: EMAILFORMAT}, uniqueness: {case_sensitive: false})

	end

>>> @user.errors.full_messages
20. $rails generate controller Users new
21. $rails server
22.  localhost:3000/users/new   in exploer  change content in views/users/new.html 
<h1> Sign Up User</h1>

<%= form_for(@admin) do |form| %>

  <div class="field">
    <%= form.label :username %>
    <%= form.text_field :username %>
  </div>
  <div class="field">
    <%= form.label :email %>
    <%= form.text_field :email %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

23.  add this to routes.rb   in config

     resources :admins

24. in admins_controller.rb  add  new to instance

class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end
end

  def allconent
    @admin = Admin.all
  end

25. $rails generate controller Sessions new
26. add following to routes

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

