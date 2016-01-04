require 'spec_helper'

module JSONAPIErrors
  module Rails
    describe Controller do
      describe '#rescue_from' do
        class Stub; end
        before {expect(Stub).to receive(:rescue_from).with(StandardError, with: :render_error)}
        it 'rescue StandardError with #render_error' do
          Stub.class_eval do
            include Controller
          end
        end
      end

      class RailsControllerStub
        def self.rescue_from(*klasses, &block);end

        include JSONAPIErrors::Rails::Controller
      end

      describe '#render_error' do
        subject{RailsControllerStub.new}
        let(:exception) {StandardError.new}
        before do
          expect(HashRenderer).to receive(:new).with(exception).and_return(double(render: {status: "422", title: "Title", detail: "Detail of the error"}))
        end
        it 'renders json from HashRenderer#render data and status' do
          expect(subject).to receive(:render).with(json: {status: "422", title: "Title", detail: "Detail of the error"}, status: 422)
          subject.render_error(exception)
        end
      end
    end
  end
end
