namespace :cron do
	desc "Send account emails"
	  task deliver_emails: :environment do
	    
	    # ... whatever logic you need

	    @all_appointments = Appointment.all
	    @all_patient_email = []
	    @all_appointments.each do |ap|

	      
	      
	      d = ap.date.to_s.split("-")
	      t = ap.time.strftime("%H:%M:%S %z").to_s.split(":")

	      appointment_date = DateTime.new(d[0].to_i, d[1].to_i, d[2].to_i, t[0].to_i, t[1].to_i, t[2].to_i, t[3].to_i).change(:offset => "+0530")

	      current_date = DateTime.now()
	      difference_in_time = ((appointment_date.to_time - current_date.to_time) /3600)  * 60

	      puts difference_in_time
	      # for testing purpose the number of minutes is taken as <=30 that means mail will be sent every minutes in 30.
	      #Actual code condition would be difference_in_time.to_i==30 
	      if difference_in_time.to_i<=30 

	            @patient_det =  Patient.where(id: ap.patient_id)

	            @patient_det.each do |pat|

	                @users = User.where(id: pat.users_id)

	                @all_patient_email.push(@users[0][:email])

	            end 
	      end
	   	end

	     @all_patient_email.each do |account|
	      ActionMailer::Base.mail(
		    from: "amyjethra@gmail.com",
		    to:"amyjethra@gmail.com",
		    subject: "You have an appointment with the Doc!",
		    body: "Hi, This is a reminder that you have a doctor's appointment in half an hour. Please reach on time"
		  ).deliver
	    end
	  end
end


