class Api::V2::SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :destroy]

  # GET /api/v2/sensors
  def index
    @sensors = Sensor.all

    if @sensors.blank?
      render status: :ok, json: {succes: {status: 200, message: 'No existen sensores creados'}, data: @sensors}.to_json
    else
      render status: 200, json: {succes: {status: 200}, data: @sensors}.to_json
    end
  end

  # GET /api/v2/sensors/1
  def show
    if @sensor.nil?
      render status: 404, json: {error: {status: 404, message: "No se encuentra sensor con id=#{params[:id]}"}}.to_json
    else
      info = {
          'sensor': @sensor
      }
      render status: 200, json: {succes: {status: 200}, data: info}.to_json
    end
  end

  # POST /api/v2/sensors
  def create
    @sensor = Sensor.new(:name => params[:name],:description => params[:description],:units => params[:units])

    if @sensor.save
      render status: :created, json: {succes: {status: 201, message: 'Sensor creado'}, data: @sensor}.to_json
    else
      render json: @sensor.errors, status: :unprocessable_entity
    end
  end


  # DELETE /api/v2/sensors/1
  def destroy
    nodos = @sensor.nodes
    @sensor.nodes.delete(nodos)
    @sensor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sensor_params
      params.fetch(:sensor, {})
    end
end
