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
    describe "#render" do
      let (:render) { lambda { subject.render exception } }
      context 'exception not present in exception_matches' do
        let(:exception) { Exception.new }
        it 'raises an UnhandledException error' do
          expect{render.call}.to raise_error Errors::UnhandledException
        end
      end
      context 'exception present in matches' do
          let(:exception) {MatchedException.new("exception message")}
          context 'exception inherits from JSONAPIErrorsException' do
            context 'the exception values are overridden' do
              xit 'render error hash with the overridden values'
            end
            context 'the exception values are not given' do
              xit 'render error hash using the default exception values present in the class'
            end
          end

          context 'status,description and title are overridden' do
            it 'render error hash with the overridden values' do
              expect(render.call).to eq({errors: [matched_exception_data]})
            end
          end
          context 'status,description and title are not overridden' do
            let(:matched_exception_data) { Hash.new }
            it 'render error hash with status 500 title Exception class and detail exception message' do
              expect(render.call).to eq({errors: [{title: "JSONAPIErrors::MatchedException", detail: "exception message", status: "500"}]})
            end
          end
      end

    end
  end
end