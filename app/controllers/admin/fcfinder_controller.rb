class Admin::FcfinderController < Admin::ApplicationController
  def index
    if request.post?
      if session[:user_id]
        render text: Fcfinder::Connector.new(File.join(Rails.public_path, 'uploads', "/*"), request.env["HTTP_HOST"], params[:fcfinder],
                                             {
                                                 :max_file_size => 1_000_000,
                                                 :allowed_mime => {'pdf' => 'application/pdf'},
                                                 :disallowed_mime => {}
                                             }).run, :layout => false
      else
        render :text => "Access not allowed!".to_json, :layout => false
      end
    else
      render :layout => false
    end
  end


  def download
    send_file File.join(Rails.public_path,'uploads',params[:path].split(":").join("/")+"."+params[:format])
  end
end
