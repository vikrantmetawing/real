class UserMailer < ActionMailer::Base
  default from: "sharmavikrant14@gmail.com"
   def property_details(property,email,name)
  @name=name
  @property=property
    mail(:to => email, :subject => " realestate.com Details of Property ",:from =>"sharmavikrant14@gmail.com")
  end
   def welcome_email(id,name,password,email)
	@id=id
	@name=name
	@link="http://testrealestate.herokuapp.com/real/user_validate?method=post&name=0&uid="+id.to_s
	
	@password=password
   
    mail(:to => email, :subject => "Welcome to Realestate Site")
  end
  def contact_request(email,name,u_email,phone,message)
	@u_email=u_email
	@name=name
	@phone=phone
	@message=message
	
	

   
    mail(:to => email, :subject => "Someone  want to contact with us ")
  end
  def req(email,name,u_email,phone,propertytype,subpropertytype,purpose,bedroom,price,location)
       @u_email=u_email
       @name=name
       @phone=phone
       @propertytype=propertytype
       @subpropertytype=subpropertytype
       @purpose=purpose
       @bedroom=bedroom
       @price=price
       @location=location
       
       

  
   mail(:to => email, :subject => "Someone  want to contact with us ")
 end
   def master_welcome_email(id,name,password,email)
	@id=id
	@name=name
	
	#@link="http://localhost:3000/real/master_user_validate?method=post&name=0&uid="+id.to_s
	@link="http://localhost:3000/real/master_user_validate?method=post&name=0&uid="+id.to_s+"&shopname="+name.to_s

	
	@password=password
   
    mail(:to => email, :subject => "Welcome to Realestate Site")
  end
end
