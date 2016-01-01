require 'spec_helper'

module JSONAPIErrors
  class RendererImpl
    include Renderer
  end

  class MatchedException < StandardError;end

  describe Renderer do
    let(:matched_exception_data) {
      {
          id: "1",
          links: "",
          # you can override
          status: "422",
          code: "422",
          # you can override
          title: "Title",
          # you can override
          detail: "Detail of the error",
          source: "/data",
          meta: {"internal_error" => {}}
      }
    }
    before do
      JSONAPIErrors::Configuration.matches = {
          "JSONAPIErrors::MatchedException" => matched_exception_data
      }
    end
    subject {RendererImpl.new}
    describe "#render_h" do
      let (:render_h) { lambda { subject.render_h exception } }
      context 'exception not present in exception_matches' do
        let(:exception) { StandardError.new }
        it 'raises an UnhandledException error' do
          expect{render_h.call}.to raise_error Errors::UnhandledException
        end
      end
      context 'exception present in matches' do
          let(:exception) {MatchedException.new("exception message")}
          context 'exception inherits from JSONAPIErrorsException' do
            context 'the exception values are overridden' do
              xit 'renders error hash with the overridden values'
            end
            context 'the exception values are not given' do
              xit 'renders error hash using the default exception values present in the class'
            end
          end

          context 'status,description and title are overridden' do
            it 'renders error hash with the overridden values' do
              expect(render_h.call).to eq({errors: [matched_exception_data]})
            end
          end
          context 'status,description and title are not overridden' do
            let(:matched_exception_data) { Hash.new }
            it 'renders error hash with status 500 title Exception class and detail exception message' do
              expect(render_h.call).to eq({errors: [{title: "JSONAPIErrors::MatchedException", detail: "exception message", status: "500"}]})
            end
          end
      end

    end
  end
end