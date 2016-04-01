module Acme::RegistrationsHelper


  def mobile_verification_button
    return '' unless current_user.needs_mobile_number_verifying?
    html = <<-HTML
      <h5>Verify Mobile Number</h5>
      #{form_tag(verifications_path, method: "post")}
      #{button_tag('Send verification code', type: "submit", :class => 'verify_button')}
      </form>
    HTML
    html.html_safe
  end


  def verify_mobile_number_form
      # return '' if current_user.verification_code == nil
      p current_user.verification_code == nil
      html = <<-HTML
        <h5>Enter Verification Code</h5>
        #{form_tag(verifications_path, method: "patch")}
        #{text_field_tag('verification_code')}<br><br>
        #{button_tag('Submit', type: "submit")}
        </form>
      HTML
      html.html_safe
  end


end
