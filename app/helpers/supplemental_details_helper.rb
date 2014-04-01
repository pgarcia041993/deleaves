module SupplementalDetailsHelper
  def create_key(application_id, requirement_type_id)
    "#{S3_PARAMS[:program]}/#{application_id}/#{requirement_type_id}/${filename}"
  end

  def create_success_action_redirect(application_id, requirement_type_id)
    "http://#{S3_PARAMS[:root_url]}/submit_requirement/?online_application_form_id=#{application_id}&requirement_type_id=#{requirement_type_id}'"
  end

  def create_policy(application_id, requirement_type_id)
    success_action_redirect = "http://#{S3_PARAMS[:root_url]}/submit_requirement/?online_application_form_id=#{application_id}&requirement_type_id=#{requirement_type_id}'"
    policy_document = "{\"expiration\": \"2020-01-01T00:00:00Z\", \"conditions\": [ {\"bucket\": \"online-admissions\"}, [\"starts-with\", \"$key\", \"#{S3_PARAMS[:program]}/\"], {\"acl\": \"public-read\"}, {\"success_action_redirect\": \"#{success_action_redirect}\"}, [\"content-length-range\", 0, 10485760] ]}"

    require 'base64'
    require 'openssl'
    require 'digest/sha1'

    @policy = Base64.encode64(policy_document).gsub("\n","")
  end

  def create_signature(application_id, requirement_type_id)
    success_action_redirect = "http://#{S3_PARAMS[:root_url]}/submit_requirement/?online_application_form_id=#{application_id}&requirement_type_id=#{requirement_type_id}'"

    access_secret = S3_PARAMS[:access_secret]
    policy_document = "{\"expiration\": \"2020-01-01T00:00:00Z\", \"conditions\": [ {\"bucket\": \"online-admissions\"}, [\"starts-with\", \"$key\", \"#{S3_PARAMS[:program]}/\"], {\"acl\": \"public-read\"}, {\"success_action_redirect\": \"#{success_action_redirect}\"}, [\"content-length-range\", 0, 10485760] ]}"

    require 'base64'
    require 'openssl'
    require 'digest/sha1'

    @policy = Base64.encode64(policy_document).gsub("\n","")

    @signature = Base64.encode64(
        OpenSSL::HMAC.digest(
            OpenSSL::Digest::Digest.new('sha1'),
            access_secret, @policy)
    ).gsub("\n","")
  end
end