class RealController < ApplicationController
	 def contactmail
               if params[:commit] == "send" then
                               Properties.find_by_sql(["INSERT INTO contactmail_"+$master_user_id.to_s+"(name,email,phone,property_type,sub_property_type,purpose,bed_room,price_limit,location) VALUES (?,?,?,?,?,?,?,?,?)" ,params[:name],params[:email],params[:phone],params[:propertytype],params[:subpropertytype],params[:purpose],params[:bedroom],params[:price],params[:location]])
                               
                               UserMailer.req($c_email,params[:name],params[:email],params[:phone],params[:propertytype],params[:subpropertytype],params[:purpose],params[:bedroom],params[:price],params[:location]).deliver
                               flash[:notice] = "#{'We accept your request,we will contact you ' }"
                              redirect_to :action => 'home'
                       end
       end
 
		def adminhome_edit
               
		   #@a=params[:id]
		   @t=Home.find_by_sql(["select * from homes where user_id = ?  ", $master_user_id])
		   
		   
		   #render :layout => "adminhome"
       end
		
	
	def master_signup 
			if params[:commit] == "upload" then
					if (MasterUsers.last).blank? then 
						a=0
					else
					a = ((MasterUsers.last).master_user_id)
	
					end

					if a == 'nil' then
						a = 0
					end
					a += 1
					if params[:password] == params[:confirmpassword] then
						 MasterUsers.create(:master_user_id => a,:shop_name => params[:name],:password=>params[:password],:master_email=>params[:email])
						 UserMailer.master_welcome_email( a,params[:name],params[:password],params[:email]).deliver
						 
					end
					flash[:notice] = "#{'Your account created successfully and your user id  =' + a.to_s()}"
					redirect_to :action => 'fst'
				end
			
	end
	
	def fst
		render :layout => "front"
	end
	def s
	connection = ActiveRecord::Base.connection();

			#@t=connection.execute("alter  table master_users alter column master_user_id INTEGER PRIMARY KEY AUTOINCREMENT")
			# MasterUsers.create(:master_user_id => 1,:shop_name => "example",:password=>"example",:master_email=>"example")
			 #@a = (MasterUsers.last).master_user_id
			 #@a = @l.master_user_id
			#@a=connection.execute("DELETE FROM homes WHERE user_id=5;")
			#	@a=connection.execute("DELETE FROM m_contacts WHERE user_id=5;")
			#	@a=connection.execute("DELETE FROM m_stories WHERE user_id=5;")
				#@a=connection.execute("DROP TABLE properties_3;")
			#@a=connection.execute("DROP TABLE contactpeople_5;")
			#@a=connection.execute("DROP TABLE storiesses_5;")
			#@a=connection.execute("DROP TABLE users_3;")
			#s="CREATE TABLE "+ "storiesses_"+$master_user_id.to_s+"(story_id INTEGER PRIMARY KEY AUTOINCREMENT,sub_user_id int,name varchar2(100),email varchar(255),phone varchar(255),story varchar(255),image vaarchar(2))"
			#connection.execute(s)
			#@a=connection.execute("select * from contactpeople_5;")
			@a= MasterUsers.find_by_shop_name("jumbo").nil?
		#@shopname=params[:shopname]
		#@uid=params[:uid]
		render :layout => "a"
	end
	
		def basic_view
		
							#$master_user_id=(MasterUsers.find_by_shop_name(params[:id])).master_user_id
							if params[:name]=="master_user_validate"
							   #$master_user_id=(Home.find_by_c_name(params[:id])).user_id
								
								$userflag="false"
								h_detail=Home.find_by_user_id($master_user_id)
								c_detail=MContact.find_by_user_id($master_user_id)
								s_detail=MStories.find_by_user_id($master_user_id)
								$slider_1=h_detail.slider_img_1
								$slider_2=h_detail.slider_img_2
								$slider_3=h_detail.slider_3
								$logo=h_detail.logo
								$company_image_1=h_detail.c_img_1
								$company_image_2=h_detail.c_img_2
								$company_name=h_detail.c_name
								$address=h_detail.address
								$phone=h_detail.phone
								$c_contant=c_detail.contant
								$c_email=c_detail.email
								$s_contant=s_detail.contant
								#redirect_to :action => 'home'
								 redirect_to :controller=>$master_user_name, :action => 'home'
							end
						
						if params[:name] != "master_user_validate"
						
							if (MasterUsers.find_by_shop_name(params[:id]).nil?) then 
								flash[:notice] = "#{'ERROR: There  is no shop with this name ' }"
								$userflag="false"
								redirect_to  :action => 's'
								#redirect_to :action => 'home'
							
							else 
						
							$userflag="false"
							
							$master_user_id=(MasterUsers.find_by_shop_name(params[:id])).master_user_id
							$master_user_id=(MasterUsers.find_by_shop_name(params[:id])).master_user_id
							$master_user_name=(MasterUsers.find_by_shop_name(params[:id])).shop_name
							#$master_user_name=(MasterUsers.find_by_shop_name("rajat")).shop_name
							h_detail=Home.find_by_user_id($master_user_id)
							c_detail=MContact.find_by_user_id($master_user_id)
							s_detail=MStories.find_by_user_id($master_user_id)
							$slider_1=h_detail.slider_img_1
							$slider_2=h_detail.slider_img_2
							$slider_3=h_detail.slider_3
							$logo=h_detail.logo
							$company_image_1=h_detail.c_img_1
							$company_image_2=h_detail.c_img_2
							$company_name=h_detail.c_name
							$address=h_detail.address
							$phone=h_detail.phone
							$c_contant=c_detail.contant
							$c_email=c_detail.email
							$s_contant=s_detail.contant
							#redirect_to :action => 'home'
							 redirect_to :controller=>$master_user_name, :action => 'home'
							end
						end	
		end
		def x
		
	connection = ActiveRecord::Base.connection();
			#@results = connection.execute("ALTER contactpeople mytable ALTER COLUMN phone string")
			
			#s="CREATE TABLE "+ "properties_5"+"(property_id INTEGER PRIMARY KEY AUTOINCREMENT,property_name varchar(255),price varchar(255),state varchar(255),property_type varchar(255),purpose varchar(255),bedroom int,image varchar(255),sub_property_type varchar(255),contant varchar(255),created_at datetime,updated_at datetime)"
			connection.execute(s)
	end
		
		def admin_contact
		if params[:commit] == "upload" then
					contant=params[:contant]
					email=params[:email]
				 User.find_by_sql(["UPDATE m_contacts SET contant=?,email=? WHERE user_id=?",contant,email,$userid])	
				# Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
							c_detail=MContact.find_by_user_id($master_user_id)
							$c_contant=c_detail.contant
							$c_email=c_detail.email
							
			#redirect_to :action => 'contact'
			 redirect_to :controller=>$master_user_name, :action => 'contact'
			end
		end
		def admin_stories
		if params[:commit] == "upload" then
					contant=params[:contant]
					
				 User.find_by_sql(["UPDATE m_stories SET contant=? WHERE user_id=?",contant,$master_user_id])	
				# Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
							s_detail=MStories.find_by_user_id($master_user_id)
							$s_contant=s_detail.contant
			#redirect_to :action => 'story'
			 redirect_to :controller=>$master_user_name, :action => 'story'
			end
		end
		
		
		def admin_home
		
		if params[:commit]=="save name" then 
				
			
				 User.find_by_sql(["UPDATE homes SET c_name=? WHERE user_id=?",params[:name],$master_user_id])	
				h_detail=Home.find_by_user_id($master_user_id)
							
							
							$company_name=h_detail.c_name
							
				redirect_to :controller=>$master_user_name, :action => 'home'
				
		end
		
		if params[:commit]=="testsubmit" then 
				if !params[:upload4].blank?
				name = params[:upload4][:file4].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload4][:file4].read) }
				flash[:notice] = "File uploaded"
				logo = File.join("/images/", name)
				end
				
				 User.find_by_sql(["UPDATE homes SET logo=? WHERE user_id=?",logo,$master_user_id])	
				h_detail=Home.find_by_user_id($master_user_id)
							
							
							$logo=h_detail.logo
							
				redirect_to :controller=>$master_user_name, :action => 'home'
				
		end
		if params[:commit]=="slider_1" then 
				if !params[:upload1].blank?
				name = params[:upload1][:file1].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload1][:file1].read) }
				flash[:notice] = "File uploaded"
				slider_1 = File.join("/images/", name)
				end
				
				 User.find_by_sql(["UPDATE homes SET slider_img_1=? WHERE user_id=?",slider_1,$master_user_id])	
				h_detail=Home.find_by_user_id($master_user_id)
							
							
							$slider_1=h_detail.slider_img_1
							
				redirect_to :controller=>$master_user_name, :action => 'home'
				
		end
		if params[:commit]=="slider_2" then 
				if !params[:upload2].blank?
				name = params[:upload2][:file2].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload2][:file2].read) }
				flash[:notice] = "File uploaded"
				slider_2 = File.join("/images/", name)
				end
				
				 User.find_by_sql(["UPDATE homes SET slider_img_2=? WHERE user_id=?",slider_2,$master_user_id])	
				h_detail=Home.find_by_user_id($master_user_id)
							
							
							$slider_2=h_detail.slider_img_2
							
				redirect_to :controller=>$master_user_name, :action => 'home'
				
		end
		if params[:commit]=="slider_3" then 
				if !params[:upload3].blank?
				name = params[:upload3][:file3].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload3][:file3].read) }
				flash[:notice] = "File uploaded"
				slider_3 = File.join("/images/", name)
				end
				 User.find_by_sql(["UPDATE homes SET slider_3=? WHERE user_id=?",slider_3,$master_user_id])	
				h_detail=Home.find_by_user_id($master_user_id)
							
							
							$slider_3=h_detail.slider_3
							
				redirect_to :controller=>$master_user_name, :action => 'home'
				
		end
		
		
		if params[:commit]=="cancle" then
		h_detail=Home.find_by_user_id($master_user_id)
							
							$slider_1=h_detail.slider_img_1
							$slider_2=h_detail.slider_img_2
							$slider_3=h_detail.slider_3
							$logo=h_detail.logo
							$company_image_1=h_detail.c_img_1
							$company_image_2=h_detail.c_img_2
							$company_name=h_detail.c_name
							$address=h_detail.address
							$phone=h_detail.phone
							
		end
		
		if params[:commit] == "submit" then
				
				if !params[:upload1].blank?
				name = params[:upload1][:file1].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload1][:file1].read) }
				flash[:notice] = "File uploaded"
				slider_1 = File.join("/images/", name)
				end
				if !params[:upload2].blank?
				name = params[:upload2][:file2].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload2][:file2].read) }
				flash[:notice] = "File uploaded"
				slider_2 = File.join("/images/", name)
				end
				if !params[:upload3].blank?
				name = params[:upload3][:file3].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload3][:file3].read) }
				flash[:notice] = "File uploaded"
				slider_3 = File.join("/images/", name)
				end
				if !params[:upload4].blank?
				name = params[:upload4][:file4].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload4][:file4].read) }
				flash[:notice] = "File uploaded"
				logo = File.join("/images/", name)
				end
				if !params[:upload5].blank?
				name = params[:upload5][:file5].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload5][:file5].read) }
				flash[:notice] = "File uploaded"
				company_image_1 = File.join("/images/", name)
				end
				if !params[:upload6].blank?
				name = params[:upload6][:file6].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload6][:file6].read) }
				flash[:notice] = "File uploaded"
				company_image_2 = File.join("/images/", name)
				end
					company_name=params[:name]
					address=params[:email]
					phone=params[:phone]
					about_us=params[:story]
				 User.find_by_sql(["UPDATE homes SET c_name=?,phone=?,address=?,logo=?,slider_img_1=?,slider_img_2=?,slider_3=?,c_img_1=?,c_img_2=? WHERE user_id=?",company_name,phone,address,logo,slider_1,slider_2,slider_3,company_image_1,company_image_2,$master_user_id])	
				# Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
							h_detail=Home.find_by_user_id($master_user_id)
							
							$slider_1=h_detail.slider_img_1
							$slider_2=h_detail.slider_img_2
							$slider_3=h_detail.slider_3
							$logo=h_detail.logo
							$company_image_1=h_detail.c_img_1
							$company_image_2=h_detail.c_img_2
							$company_name=h_detail.c_name
							$address=h_detail.address
							$phone=h_detail.phone
							
			#redirect_to :action => 'home'
			redirect_to :controller=>$master_user_name, :action => 'home'
			end
			if params[:commit]=="preview"
				if !params[:upload1].blank?
				name = params[:upload1][:file1].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload1][:file1].read) }
				flash[:notice] = "File uploaded"
				slider_1 = File.join("/images/", name)
				end
				if !params[:upload2].blank?
				name = params[:upload2][:file2].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload2][:file2].read) }
				flash[:notice] = "File uploaded"
				slider_2 = File.join("/images/", name)
				end
				if !params[:upload3].blank?
				name = params[:upload3][:file3].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload3][:file3].read) }
				flash[:notice] = "File uploaded"
				slider_3 = File.join("/images/", name)
				end
				if !params[:upload4].blank?
				name = params[:upload4][:file4].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload4][:file4].read) }
				flash[:notice] = "File uploaded"
				logo = File.join("/images/", name)
				end
				if !params[:upload5].blank?
				name = params[:upload5][:file5].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload5][:file5].read) }
				flash[:notice] = "File uploaded"
				company_image_1 = File.join("/images/", name)
				end
				if !params[:upload6].blank?
				name = params[:upload6][:file6].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload6][:file6].read) }
				flash[:notice] = "File uploaded"
				company_image_2 = File.join("/images/", name)
				end
					company_name=params[:name]
					address=params[:email]
					phone=params[:phone]
					about_us=params[:story]
				# User.find_by_sql(["UPDATE homes SET c_name=?,phone=?,address=?,logo=?,slider_img_1=?,slider_img_2=?,slider_3=?,c_img_1=?,c_img_2=? WHERE user_id=?",company_name,phone,address,logo,slider_1,slider_2,slider_3,company_image_1,company_image_2,$master_user_id])	
				# Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
			#h_detail=Home.find_by_user_id($master_user_id)
							
							$slider_1=slider_1
							$slider_2=slider_2
							$slider_3=slider_3
							$logo=logo
							$company_image_1=company_image_1
							$company_image_2=company_image_2
							$company_name=company_name
							$address=address
							$phone=phone
							
			#redirect_to :action => 'home'
			redirect_to :controller=>$master_user_name, :action => 'previewhome'	
		end
		end
		
		def previewhome
		
		
		
		
		if params[:commit]=="Save" then 
		 User.find_by_sql(["UPDATE homes SET c_name=?,phone=?,address=?,logo=?,slider_img_1=?,slider_img_2=?,slider_3=?,c_img_1=?,c_img_2=? WHERE user_id=?",$company_name,$phone,$address,$logo,$slider_1,$slider_2,$slider_3,$company_img_1,$company_img_2,$master_user_id])	
			redirect_to :controller=>$master_user_name, :action => 'adminhome'	
		end
		end
		
		
	
		
	
		def test
		
		@a =Home.all
		@b=MContact.all	
		@c=MStories.all
		@d=MasterUsers.all
		connection = ActiveRecord::Base.connection();
   		
		@e= $master_user_id
		
			
			@e=connection.execute("create table persons_1000 (id int );")
			
 
		end
		def user_validate
		
            connection = ActiveRecord::Base.connection();
   		
		
		 User.find_by_sql(["UPDATE users_" +$master_user_id.to_s + " SET validates=? WHERE sub_user_id=?",true,params[:uid]])
		#redirect_to :action => 'userlogin'
		 redirect_to :controller=>$master_user_name, :action => 'userlogin'
		end
		
		def master_user_validate
			$master_user_id=params[:uid]	
			$master_user_name=params[:shopname]
			Home.create(:user_id=>params[:uid],:c_name=>params[:shopname],:phone=>"0000000000000",:address=>"Company Address ",:logo=>"/images/01.jpg",:slider_img_1=>"/images/01.jpg",:slider_img_2=>"/images/01.jpg",:slider_3=>"/images/01.jpg",:c_img_1=>"/images/01.jpg",:c_img_2=>"/images/01.jpg") 
			MContact.create(:user_id =>params[:uid],:contant=>"Write some conatnt for your user",:email=>"sachinsingh.7903@gmail.com")
			MStories.create(:user_id =>params[:uid],:contant=>"Write some conatnt for your user")	
			connection = ActiveRecord::Base.connection();
			#@results = connection.execute("ALTER contactpeople mytable ALTER COLUMN phone string")
			s="CREATE TABLE "+ "contactpeople_"+$master_user_id.to_s+"(name varchar2(100),email varchar(255),phone varchar(255),message varchar(255))"
			connection.execute(s)
			s="CREATE TABLE "+ "properties_"+$master_user_id.to_s+"(property_id INTEGER PRIMARY KEY AUTOINCREMENT,property_name varchar(255),price varchar(255),state varchar(255),property_type varchar(255),purpose varchar(255),bedroom int,image varchar(255),sub_property_type varchar(255),contant varchar(255),created_at datetime,updated_at datetime)"
			connection.execute(s)
			s="CREATE TABLE "+ "storiesses_"+$master_user_id.to_s+"(story_id INTEGER PRIMARY KEY AUTOINCREMENT,sub_user_id int,name varchar2(100),email varchar(255),phone varchar(255),story varchar(255),image vaarchar(2))"
			connection.execute(s)
			s="CREATE TABLE "+ "users_"+$master_user_id.to_s+"( sub_user_id INTEGER PRIMARY KEY AUTOINCREMENT,name varchar2(100),password varchar(255),my_properties varchar(255),email varchar(255),validates boolean )"
			connection.execute(s)
			s="CREATE TABLE "+ "contactmail_"+$master_user_id.to_s+"(name varchar2(100),email varchar(255),phone varchar(255),property_type varchar(255),sub_property_type varchar(255),purpose varchar(255),bed_room varchar(255), price_limit varchar(255),location varchar(255))"
			connection.execute(s)
 
			
			  MasterUsers.find_by_sql(["UPDATE master_users SET validate=? WHERE master_user_id=?",true,params[:uid]])
			#redirect_to :action =>'basic_view',:name=>"master_user_validate"	
			 redirect_to :controller=>$master_user_name, :action => 'basic_view',:name=>"master_user_validate"
			
		end
		
		
		def property
		end
		 def proplist
       
              
               if params[:name]=="deleteproperty"
			   connection = ActiveRecord::Base.connection();
					t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
                       @x=t[0][0]
                       @a = @x
                       @dl = params[:p_id].to_s
                      
                       if @x != nil then
                                        @a.slice! params[:p_id]+","          
                       end
                       User.find_by_sql(["UPDATE users_" + $master_user_id.to_s+ " SET my_properties=? WHERE sub_user_id=?",@a,$userid])
                               flash[:notice] = "#{'This property is deleted from your list sucessfully' }"
                        #redirect_to :action => 'homesearch',:name=>"delete"
                        redirect_to :controller=>$master_user_name, :action => 'homesearch',:name=>"delete"
               end
               
               if params[:name]=="admindeleteproperty"
                       Properties.find_by_sql(["DELETE FROM properties_" + $master_user_id.to_s+ " WHERE property_id= ?",[params[:p_id]]])
						flash[:notice] = "#{'This property is deleted from your database' }"   
						#redirect_to :action => 'search',:name=>"delete"
						redirect_to :controller=>$master_user_name, :action => 'search',:name=>"delete"						
			  end
       
              
       end
		 def adminstorydelete
       
               if params[:name] == "deletestory"
			    connection = ActiveRecord::Base.connection();
				    Properties.find_by_sql("DELETE FROM storiesses_" +$master_user_id.to_s + "  WHERE story_id="+ params[:s_id].to_s)
              # redirect_to :action => 'story'
               redirect_to :controller=>$master_user_name, :action => 'story'
               
               end
       end
		def usersignup
			if params[:commit]=="Submit" then
				if params[:password]==params[:confirmpassword] then 
				    connection = ActiveRecord::Base.connection();
				    Properties.find_by_sql(["INSERT INTO users_"+$master_user_id.to_s+"(name,password,email) VALUES (?,?,?)",params[:name],params[:password],params[:email]])
					
					@t=connection.execute("SELECT sub_user_id FROM users_" +$master_user_id.to_s+ " WHERE sub_user_id=(SELECT MAX(sub_user_id) FROM users_"+ $master_user_id.to_s+" )")
					UserMailer.welcome_email(@t[0][0],params[:name],params[:password],params[:email]).deliver
					flash[:notice] = "#{'your account is created sucessfully details send to your EMail Id and your login id is = '+ @t[0][0].to_s }"	
					#redirect_to :action => 'userlogin'
					 redirect_to :controller=>$master_user_name, :action => 'userlogin'
				else 
					flash[:notice] = "#{'confirm password and Password not match'}"		
				end
			end
		end
		
		def userlogin	
		
			if params[:commit]== "login" then
			connection = ActiveRecord::Base.connection();
			 #@t= "select * from properties_" + $master_user_id.to_s+ " where sub_user_id = "+params[:loginid]
			member=connection.execute("select * from users_" + $master_user_id.to_s+ " where sub_user_id = "+params[:loginid])	
	#$t=connection.execute("select * from users_34")

				if member != nil then
				
					if   member[0][2]==params[:password]
						if member[0][5]=="t" then
							$userid=params[:loginid]
							$userflag="true"
							
							 redirect_to :controller=>$master_user_name, :action => 'home'
							#redirect_to :action => 'home'
						else
							flash[:notice] = "#{'you need to varify your Email id before login'}"					
							#redirect_to :action => 'userlogin'
							 redirect_to :controller=>$master_user_name, :action => 'userlogin'
						end
					else
						flash[:notice] = "#{'Invalid Login and Password details'}"					
						#redirect_to :action => 'userlogin'
						 redirect_to :controller=>$master_user_name, :action => 'userlogin'
					end
				else
				flash[:notice] = "#{'Please enter details properly'}"					
							#redirect_to :action => 'userlogin'
							 redirect_to :controller=>$master_user_name, :action => 'userlogin'
				end		
			end
							
			
			
			
			
		end
		
		def admin_property_view
			#@t=Properties.all
			connection = ActiveRecord::Base.connection();
			@t=connection.execute("select * from properties_"+$master_user_id.to_s)
		end
		
		def property_add
		#@test=(["insert into properties (name, email, phone, story,created_at,updated_at) values (?,?,?,?,?,?)",[$x],[$y],[$z],[$p],[$q],[$r]])
			
			if params[:commit] == "upload" then
				if !params[:upload].blank?
				name = params[:upload][:file].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
				flash[:notice] = "File uploaded"
				@path1 = File.join("/images/", name)
				
				
				end
				case params[:property_type][:item_type]
					when '1'
						property_type=""
					when '2'
					property_type="Commercial"
						
					when '3'
						property_type="Industrial"
						
					when '4'
					property_type="Land"
						
					when '5'
					property_type="Residential"
						
				end
				case params[:sub_property_type][:item_type]
					when '1'
						sub_property_type=""
					when '2'
					sub_property_type="Condo"
						
					when '3'
						sub_property_type="Appartment"
						
					when '4'
					sub_property_type="Duplex"
						
					when '5'
					sub_property_type="Triplex"
						
				end
				case params[:Purpose][:item_type]
					when '1'
						purpose=""
					when '2'
					purpose="Rental"
						
					when '3'
						purpose="Sale"
				
				end
				
				
					#Properties.create(:property_id => params[:propertyid],:property_name=>params[:propertyname],:price=>params[:price],:state=>params[:state],:property_type=>params[:propertytype],:sub_property_type=>params[:subpropertytype],:bedroom=>params[:bedroom],:image=>@path1)
		connection = ActiveRecord::Base.connection();
		Properties.find_by_sql(["INSERT INTO properties_"+$master_user_id.to_s+"(property_name,price,state,property_type,purpose,bedroom,image,sub_property_type,contant,created_at,updated_at) VALUES (?,?,?,?,?,?,?,?,?,?,?)",params[:propertyname],params[:price],params[:state],property_type,purpose,params[:bedroom].to_i,@path1,sub_property_type,params[:contant],Time.now.strftime("%m/%d/%Y"),Time.now.strftime("%m/%d/%Y")])
		#connection.execute(INSERT INTO properties_+$master_user_id.to_s+(property_id,property_name,price,state,property_type,purpose,bedroom,image,sub_property_type,contant,created_at,updated_at) VALUES +(1,params[:propertyname],params[:price],params[:state],params[:propertytype],params[:purpose],params[:bedroom],@path,params[:subpropertytype],params[:contant])
			
		
			end
		end
		
		def property_edit
			
			#@t=Properties.find_by_sql(["select * from properties_"+$master_user_id.to_s +" where property_id = ?  ", @a])
			if params[:commit]=="Save" then
				Properties.find_by_sql(["update properties_"+$master_user_id.to_s+"  set property_name = ?, price = ?,state=? ,property_type = ?,purpose = ?, sub_property_type = ? ,bedroom =?,contant=? where property_id = ? ",params[:propertyname],params[:price],params[:state],params[:propertytype],params[:purpose],params[:subpropertytype],params[:bedroom],params[:contant],params[:propertyid]])
				#redirect_to :action => 'admin_property_view'
			 redirect_to :controller=>$master_user_name, :action => 'admin_property_view'
			else	
				@a=params[:id]
				connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id ="+ @a)
			end
		end
		
		def property_delete
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("DELETE FROM properties_" +$master_user_id.to_s+ " WHERE property_id=" +params[:id])
			#Properties.find_by_sql(["DELETE FROM properties WHERE property_id= ?",[params[:id]]])
			#redirect_to :action => 'admin_property_view'
		 redirect_to :controller=>$master_user_name, :action => 'admin_property_view'
		end
		
		def admin
		
			if params[:g] == "h" then 
				$adminflag="false"
			end
			
			if params[:commit]=="upload"
			
			connection = ActiveRecord::Base.connection();
				password=(MasterUsers.find_by_master_user_id($master_user_id)).password
			if(password==params[:currentpwd]) then 
				User.find_by_sql(["update master_users set password = ? where master_user_id = ? ",params[:newpwd],$master_user_id])
				flash[:notice] = "#{'password is updated sucessfully'}"
				#redirect_to :action => 'userlogin'
			 redirect_to :controller=>$master_user_name, :action => 'adminhome'
			else
				flash[:notice] = "#{'current password invalid'}"
				#redirect_to :action => 'userchangepwd'
			 redirect_to :controller=>$master_user_name, :action => 'changepwd'
			end	
			
			end
			
			
			if params[:commit]== "login" then
				connection = ActiveRecord::Base.connection();
				member=connection.execute("select * from master_users where shop_name="+"'"+params[:shopname].to_s+"'")
					if 	member[0]==nil  then
					flash[:notice] = "#{'There is no shop with this name'}"					
								redirect_to :action => 'admin'
					else
					member=connection.execute("select * from master_users where shop_name="+"'"+params[:shopname].to_s+"'")
						if   member[0][2]==params[:password]
							if member[0][4]=="t" then
								#$userid=params[:loginid]
								#$userflag="true"
							
								$masterflag="true"
								$master_user_id=member[0][0]
								 redirect_to :controller=>member[0][1], :action => 'adminhome'
								#redirect_to :action => 'adminhome'
								$mode="edit"
							else
								flash[:notice] = "#{'you need to varify your Email id before a'}"					
								#redirect_to :action => 'admin'
							 redirect_to :controller=>$master_user_name, :action => 'admin'
							end
						else
							flash[:notice] = "#{'Invalid Password details'}"					
							#redirect_to :action => 'admin'
							 redirect_to :controller=>$master_user_name, :action => 'admin'
						end
					
					
					end		
			else 
			 render :layout => 'front'
			
			end
							
		
			
		end
		
		def uchangepwd
		connection = ActiveRecord::Base.connection();
				password=connection.execute("select password from users_" +$master_user_id.to_s+ " WHERE sub_user_id=" +params[:user_id])
			if(password[0][0]==params[:currentpwd]) then 
				User.find_by_sql(["update users_"+ $master_user_id.to_s+ " set password = ? where sub_user_id = ? ",params[:newpwd],params[:user_id]])
				flash[:notice] = "#{'password is updated sucessfully'}"
				#redirect_to :action => 'userlogin'
			 redirect_to :controller=>$master_user_name, :action => 'userlogin'
			else
				flash[:notice] = "#{'user id and password not match'}"
				#redirect_to :action => 'userchangepwd'
			 redirect_to :controller=>$master_user_name, :action => 'userchangepwd'
			end	
		end
		
		def userlogout
			$userid=0
			$userflag="false"
			#redirect_to :action => 'home'
			 redirect_to :controller=>$master_user_name, :action => 'home'
		end
		
		def logout
		$masterflag="false"
		   $adminflag="false"
		   $mode="false"
		   
		  # redirect_to :action => 'home'
		  redirect_to :controller=>$master_user_name, :action => 'home'
       end
	   
		def adminlogin
			if params[:commit] == "login" then
				if   member = Adminlogin.find_by_loginid(params[:loginid]) && pwd = Adminlogin.find_by_password(params[:password])
					$adminflag="true"
					#redirect_to :action => 'home'
				redirect_to :controller=>$master_user_name, :action => 'home'
				else
					flash[:notice] = "#{'Invalid Login and Password details'}"					
					#render "login"
				redirect_to :controller=>$master_user_name, :action => 'login'
				end	
			end
		end
	
		def home
			
		s="SELECT * FROM properties_" + $master_user_id.to_s + " ORDER BY created_at DESC"
			connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
			
			#@t=Properties.find_by_sql(s)
			
					
		end
		
		def homesearch
			if params[:name]=="Residential" then 
				if $userid !=0 then 
					connection = ActiveRecord::Base.connection();
					t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
					
						if @x=t[0][0] then 
						@x.slice! ",0"
					
						end
					
					if @x != nil then			
						@a= @x+","+(params[:p_id])+",0"
					else
						@a= '0'+","+(params[:p_id])
					end
					User.find_by_sql(["UPDATE users_" + $master_user_id.to_s+ " SET my_properties=? WHERE sub_user_id=?",@a,$userid])
					flash[:notice] = "#{'This property is added to your list sucessfully' }"
					#redirect_to :action => 'search',:name=>"addlist"
					redirect_to :controller=>$master_user_name, :action => 'search',:name=>"addlist"
				end
			end
			if params[:name]=="R"
			
				@t=[]
				@test=[]
				connection = ActiveRecord::Base.connection();
				t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
				if @a=t[0][0] then 
				@p=@a.split(',')
				@p.each do |i|
					if i!='0'  then 
					@test<<i
						#@t<<Properties.find_by_property_id(i)
						@t<< connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id=" +i)
					end
				end
				end 
			end		
			if params[:name]=="delete"
				@t=[]
				@test=[]
				connection = ActiveRecord::Base.connection();
				t=connection.execute("select my_properties from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
				if @a=t[0][0] then 
				@p=@a.split(',')
				@p.each do |i|
					if i!='0'  then 
					@test<<i
						#@t<<Properties.find_by_property_id(i)
						@t<< connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id=" +i)
					end
				end
				end 
			
			end	
			#redirect_to :action => 'saved'
			 
		end
		
		def contact
			if params[:commit] == "submit" then
				Properties.find_by_sql(["INSERT INTO contactpeople_"+$master_user_id.to_s+"(name,email,phone,message) VALUES (?,?,?,?)",params[:name],params[:email],params[:phone],params[:message]])
				#Contactperson.create(:name =>params[:name],:email =>params[:email],:message =>params[:message],:phone=>params[:phone])
				UserMailer.contact_request($c_email, params[:name],params[:email],params[:phone],params[:message]).deliver
				flash[:notice] = "#{'We accept your request,we will contact you ' }"
				
			end
		end
	
		def contaview
		connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from contactpeople_"+$master_user_id.to_s)
			if params[:commit] == "viewall" then
				#@t=Contactperson.all
				connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from contactpeople_"+$master_user_id.to_s)
			end
			if params[:name]=="deletecontact"
			connection = ActiveRecord::Base.connection();
				connection.execute("DELETE FROM contactpeople_" +$master_user_id.to_s+" WHERE message="+"'" +(params[:message].to_s)+ "'")
				#redirect_to :action => 'contaview'
				redirect_to :controller=>$master_user_name, :action => 'contaview'
			end
			
		end
		def senddetails
		connection = ActiveRecord::Base.connection();
				email=connection.execute("select email from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
			#email=(User.find_by_user_id($userid)).email
			#name=(User.find_by_user_id($userid)).name
			name=connection.execute("select name from users_" +$master_user_id.to_s + " where sub_user_id ="+ $userid.to_s)
			#@p_id=params[:p_id]
			#property=Properties.find_by_property_id(@p_id)
			property=connection.execute("select * from properties_" +$master_user_id.to_s + " where property_id ="+ params[:p_id].to_s)
			UserMailer.property_details(property[0], email[0][0],name[0][0]).deliver
			flash[:notice] = "#{'Details of this Property is send to your Email Id ' }"
			redirect_to :controller=>$master_user_name, :action => 'search',:name=>"intrested"
			#redirect_to :action => 'search',:name=>"intrested"
		end
		
		def listing
		@click=params[:click]
			@p_id=params[:p_id]
			@img=params[:img]
			@price=params[:price]
			@bed=params[:bed]
			@name=params[:nam]
			@purpose=params[:purpose]
			@type=params[:type]
			@contant=params[:contant]
		end
		
		def about
		end
		
		def story
			#@t=Storiess.all
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("select * from storiesses_" +$master_user_id.to_s)
			if params[:commit] == "upload" then
				name = params[:upload][:file].original_filename
				directory = "public/images/"
				@path = File.join(directory, name)
				File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
				flash[:notice] = "File uploaded"
				@path1 = File.join("/images/", name)
			
				  Properties.find_by_sql(["INSERT INTO storiesses_"+$master_user_id.to_s+"( sub_user_id,name,email,phone,story,image) VALUES (?,?,?,?,?,?)",$userid,params[:name],params[:email],params[:phone],params[:story],@path1])
					
				 #Storiess.create(:name =>params[:name],:email =>params[:email],:story =>params[:story],:image =>@path1,:phone=>params[:phone],:user_id=>@a)
			end
		end
		
	    def storyview
			if params[:mystories]=="mystories" then
			connection = ActiveRecord::Base.connection();
				#@t=Storiess.find_by_sql(["select * from  storiesses  WHERE user_id=?",$userid])
				@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s+" where sub_user_id ="+$userid.to_s )
			end
			
			
			
			if params[:name] == "viewall" then
				#@t= Storiess.all
				#s=SELECT * FROM storiesses_" + $master_user_id.to_s 
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s )
			end
		end
       
       def storyparticular
			@u_id=params[:u_id]
			@s_id=params[:s_id]
            @a=params[:name]
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s+" where story_id="+ @s_id.to_s )
					#@t=connection.execute("SELECT * FROM storiesses_"+ $master_user_id.to_s+" where sub_user_id ="+@s_id.to_s )
            #@t =  Storiess.find_by_sql(["select * from storiesses where id = ?  ", @a])
           
       end
		
		def adminhome
		
			
			
			 render :layout=>"adminhome"
		
			if params[:commit]=="Save" then
			
			
							connection = ActiveRecord::Base.connection();
							#@t= "select * from properties_" + $master_user_id.to_s+ " where sub_user_id = "+params[:loginid]
						   member=connection.execute("select * from homes where user_id ="+ $master_user_id.to_s)
			
							#@x = Masterhome.find_by_sql(["select * from masterhomes where user_id = ?  ", $master_user_id])
			
				logo = member[0][4]
				slider_img_1 = member[0][5]
				slider_img_2 = member[0][6]
				slider_img_3 = member[0][7]
				c_img_1 = member[0][8]
				c_img_2 = member[0][9]
				
				
				if !params[:upload].blank?
					 if name = params[:upload][:file].original_filename  then
					
					directory = "public/images/"
					@path = File.join(directory, name)
					File.open(@path, "wb") { |f| f.write(params[:upload][:file].read) }
					flash[:notice] = "File uploaded"
					@path = File.join("/images/", name)
					logo = @path
					end
				end
				
				
				if !params[:upload1].blank?
					if name = params[:upload1][:file1].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload1][:file1].read) }
						flash[:notice] = "File uploaded"
						@path1 = File.join("/images/", name)
						slider_img_1 = @path1
					end
				end
			
			
				if !params[:upload2].blank?
					 if name = params[:upload2][:file2].original_filename then
				
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload2][:file2].read) }
						flash[:notice] = "File uploaded"
						@path2 = File.join("/images/", name)
						slider_img_2 = @path2
					end
				end
			
			
				if !params[:upload3].blank?
					if name = params[:upload3][:file3].original_filename  then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload3][:file3].read) }
						flash[:notice] = "File uploaded"
						@path3 = File.join("/images/", name)
						slider_img_3 = @path3
					end
				end
				
				
				
				if !params[:upload4].blank?
					 if name = params[:upload4][:file4].original_filename  then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload4][:file4].read) }
						flash[:notice] = "File uploaded"
						@path4 = File.join("/images/", name)
						c_img_1 = @path4
					end
				end
				
				
				if !params[:upload5].blank?
					if name = params[:upload5][:file5].original_filename then
						directory = "public/images/"
						@path = File.join(directory, name)
						File.open(@path, "wb") { |f| f.write(params[:upload5][:file5].read) }
						flash[:notice] = "File uploaded"
						@path5 = File.join("/images/", name)
						c_img_2 = @path5
					
				
					end
				end
			
				Home.find_by_sql(["update homes set c_name = ?, address = ?,phone=? ,logo = ?, slider_img_1 = ?,slider_img_2 = ?,slider_3 = ?, c_img_1 = ?, c_img_2 = ? where user_id = ? ",params[:companyname],params[:address],params[:phone],logo,slider_img_1,slider_img_2,slider_img_3,c_img_1,c_img_2,$master_user_id])
				
			end		
		
		end
		
		def search
			if params[:commit] == "Submit" then
				
				s="select * from properties_" +$master_user_id.to_s+ " where "	
				if params[:state]== "State" then

				else
					s=s+" state= "+  "\""+params[:state]+"\""+" and "
				end 
				if params[:i]== "Property_ID" then

				else
					s=s+"  property_id="+ params[:i]+" and "
				end
				case params[:price][:item_type]
					when '1'
						
					when '2'
						s= s+ " price BETWEEN 100 AND 300 and
"
					when '3'
						s= s+" price BETWEEN 300 AND 600 and "
					
					when '4'
						s= s+" price BETWEEN 600 AND 900 and "
					when '5'
						s= s+" price >900 and "
						
				end
				case params[:property_type][:item_type]
					when '1'
						
					when '2'
						s= s+ " property_type= "+  "\""+"commercial"+"\""+"  and"
						@pt="commercial"
					when '3'
						s= s+" property_type= "+  "\""+"industrial"+"\""+"  and"
						@pt="industrial"
					when '4'
						s= s+" property_type= "+  "\""+"land"+"\""+"  and"
						@pt="Land"
					when '5'
						s= s+" property_type= "+  "\""+"residential"+"\""+"  and"
						@pt="Residential"
						
				end
				case params[:bed_room][:item_type]
					when '1'
						
					when '2'
						s= s+ " bedroom= 1" + " and"
					when '3'
						s= s+ " bedroom=  2" +" and"  
					
					when '4'
						s= s+" bedroom=  3"+ " and"
					when '5'
						s= s+" bedroom >=  4"+  " and"
						
				end
				s=s+"   1=1"
				@t =s
					connection = ActiveRecord::Base.connection();
					@t=connection.execute(s)
				
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				$l=@t
			end
	
			if params[:name]=="addlist"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
				#@t=Properties.find_by_sql("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC" )
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Latest Properties "
				$l=@t
			end
				if params[:name]=="delete"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
				#@t=Properties.find_by_sql("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC" )
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Latest Properties "
				$l=@t
			end
			if params[:name]=="search"
			connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
				#@t=Properties.find_by_sql("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC" )
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Latest Properties "
				$l=@t
			end
			
			if params[:name]=="intrested"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute("SELECT * FROM properties_" +$master_user_id.to_s + " ORDER BY updated_at ASC")
				#@t=Properties.find_by_sql("SELECT * FROM properties_" +$master_user_id.to_s+ " ORDER BY updated_at ASC" )
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Latest Properties "
				$l=@t
			end
			if params[:name]== "Residential" then 
			 s= "select * from properties_" + $master_user_id.to_s+ " where property_type = 'residential'"
       connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Residential "
				$l=@t
			end
			if params[:name]== "Industrial" then 
			 s= "select * from properties_" + $master_user_id.to_s+ " where property_type = 'industrial'"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Industrial "
				$l=@t
			end
			if params[:name]== "Land" then 
			 s= "select * from properties_" +  $master_user_id.to_s+ " where property_type = 'Land'"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Land "
				$l=@t
			end
			if params[:name]== "Commercial" then 
				s= "select * from properties_" + $master_user_id.to_s+ " where property_type = 'commercial'"
				connection = ActiveRecord::Base.connection();
				@t=connection.execute(s)
				#@t=Properties.find_by_sql(s)
				s=0
				@t.each do |i|

					s=s+1
				end
				@s=s
				@pt="Commercial "
				$l=@t
			end
			
			if params[:commit] == "goo" then
				
				@t = $l
				@array = []
				@arr = []
				if params[:sale_checkbox] == "sale" then
					@t.each do |i|
						if i[5] == "sale"
							@arr << i
						
						end
					end
					@t = @arr
				end
				if params[:rental_checkbox] == "rental" then
					@t.each do |m|				
				
						if m[5] == "rental"
							@arr << m
						end
					end
					@t = @arr
				end
				
				if params[:condo_checkbox] == "condo" ||  params[:appartment_checkbox] == "appartment" || params[:duplex_checkbox] == "duplex" || params[:triplex_checkbox] == "triplex"
						
					if params[:condo_checkbox] == "condo" then
						@t.each do |m|	
							
							if m[8] == "condo"
								@array << m
								@pt="Condo "
							end
							
						end
					end
					
					if params[:appartment_checkbox] == "appartment" then
						@t.each do |m|					
							if m[8] == "appartment"
								@array << m	
							end
								
						end
						
					end
					
					if params[:duplex_checkbox] == "duplex" then
						@t.each do |m|				
							if m[8] == "duplex"
								@array << m
							end
						end
					end
					
					if params[:triplex_checkbox] == "triplex" then
						@t.each do |m|				
							if m[8] == "triplex"
								@array << m
							end
							
						end
					end
					@t=@array
					
				end	
			end
		end
		
		def abc
		
		connection = ActiveRecord::Base.connection();

		$te="sachin"
 
		end

		
	end 
	

  
