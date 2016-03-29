module Acme::RegistrationsHelper


  def mobile_verification_button
    return '' unless current_user.needs_mobile_number_verifying?
    html = <<-HTML
      <h3>Verify Mobile Number</h3>
      #{form_tag(verifications_path, method: "post")}
      #{button_tag('Send verification code', type: "submit")}
      </form>
    HTML
    html.html_safe
  end


  def verify_mobile_number_form
      return '' if current_user.verification_code == nil
      p current_user.verification_code == nil
      html = <<-HTML
        <h3>Enter Verification Code</h3>
        #{form_tag(verifications_path, method: "patch")}
        #{text_field_tag('verification_code')}
        #{button_tag('Submit', type: "submit")}
        </form>
      HTML
      html.html_safe
  end


end
