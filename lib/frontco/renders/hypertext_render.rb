# frozen_string_literal: true

module Frontco
  module Renders
    # Base abstract class for hypertext renders
    class HypertextRender
      include Frontco::Atoms::HypertextAtoms

      (PAIRED_TAGS + SINGLETON_TAGS).each do |tag|
        define_method(tag) do |*text, **attrs, &subtags|
          add_tag(tag, *text, **attrs, &subtags)
        end
      end

      def add_tag(tag, paired, *text, **attrs, &subtags)
        raise NotImplementedError
      end

      def render
        raise NotImplementedError
      end

      def to_file
        raise NotImplementedError
      end
    end
  end
end
