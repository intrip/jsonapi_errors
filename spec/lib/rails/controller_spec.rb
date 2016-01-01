require 'spec_helper'

module JSONAPIErrors
  module Rails
    describe Controller do
      it { is_expected.to include JSONAPIErrors::Renderer }

      describe '#rescue_from' do
        class Stub; end
        before {expect(Stub).to receive(:rescue_from).with(StandardError, with: :render)}
        it 'rescue StandardError with #render' do
          Stub.class_eval do
            include Controller
          end
        end
      end
    end
  end
end
