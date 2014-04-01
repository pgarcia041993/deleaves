class RealtimeController < ApplicationController

  # This is the default action for this controller
  def realtime_submit
    begin
      field_name = params[:field_name]
      model_name = field_name.split('[').first
      attribute_name = field_name.split('[').last.gsub(']', '')
      value = params[:value]

      record = OnlineApplicationForm.find(params[:id]).try(model_name.to_sym)
      if (record.class.columns_hash[attribute_name].type == :datetime || record.class.columns_hash[attribute_name].type == :date)
        record.update_attribute attribute_name.to_sym, DateTime.strptime(value, '%d/%m/%Y')
        begin
          record.online_application_form.update_attribute :composite_updated_at, Time.now
        rescue
        end

      else
        record.update_attribute attribute_name.to_sym, value
        begin
          record.online_application_form.update_attribute :composite_updated_at, Time.now
        rescue
        end
      end

      render :json => {"status" => "success"}.to_json and return
    rescue
      render :json => {"status" => "failure"}.to_json and return
    end
  end

end