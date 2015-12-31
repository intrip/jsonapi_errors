require 'spec_helper'

module JSONAPIErrors
  module Rails
    describe Controller do
      it {is_expected.to include JSONAPIErrors::Renderer}
    end
  end
end
