class BitsController < ApplicationController

  def index
    @bits = Bit.all
  end


  def create
    @bit = current_user.bits.build( bit_params )
    if @bit.save

    else

    end
  end


  def destroy
    @bit = current_user.bits.find( params[:id] )
    if @bit.destroy

    else

    end
  end

  private

  def bit_params
    params.require(:bit).permit(:data)
  end

end
