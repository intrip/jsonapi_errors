require 'spec_helper'

module JSONAPIErrors
  class MatchedException < StandardError;end

  describe HashRenderer do
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
    subject {HashRenderer.new(exception)}
    let(:exception) { StandardError.new("msg") }
    it 'has attr_reader for exception' do
      expect(subject.exception).to eq exception
    end

    describe "#render" do
      context 'exception not present in exception_matches' do
        let(:exception) { StandardError.new("msg") }
        context 'catch_unhandled_exceptions == true' do
          before {JSONAPIErrors::Configuration.catch_unhandled_exceptions = true}
          it 'renders json containing the Unhandled exception data' do
            expect(subject.render).to eq({errors:
                                             [{title: "Unhandled exception",
                                               detail: "The Exception: StandardError msg. is not handled in configuration.matches.",
                                               status: "500"}]
                                        })
          end
        end
        context 'catch_unhandled_exceptions == false' do
          before {JSONAPIErrors::Configuration.catch_unhandled_exceptions = false}
          it 'raises the exception up' do
            expect{subject.render}.to raise_error StandardError, "msg"
          end
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
              expect(subject.render).to eq({errors: [matched_exception_data]})
            end
          end
          context 'status,description and title are not overridden' do
            let(:matched_exception_data) { Hash.new }
            it 'renders error hash with status 500 title Exception class and detail exception message' do
              expect(subject.render).to eq({errors: [{title: "JSONAPIErrors::MatchedException", detail: "exception message", status: "500"}]})
            end
          end
      end
    end
  end
end