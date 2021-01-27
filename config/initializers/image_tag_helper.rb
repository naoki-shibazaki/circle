module ActionView
  module Helpers
    module AssetTagHelper
      def amp_image_tag(source, options = {})
        src = options[:src] = ActionController::Base.helpers.path_to_image(source, skip_pipeline: options.delete(:skip_pipeline))

        unless src.start_with?('cid:', 'data:') || src.blank?
          options[:alt] = options.fetch(:alt) { ActionController::Base.helpers.image_alt(src) }
        end
        options[:layout] ||= 'fixed'
        ActionController::Base.helpers.tag('amp-img', options)
      end

      # amp-imgかimgかをrequest.formatによって使い分ける。
      def image_tag_with_amp(source, options = {})
        if amp?
          amp_image_tag(source, options)
        else
          image_tag_without_amp(source, options)
        end
      end

      def amp?
        Thread.current[:format] == 'amp'
      end
      alias_method_chain :image_tag, :amp
    end
  end