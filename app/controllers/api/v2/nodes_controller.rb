class Api::V2::NodesController < ApplicationController
  before_action :set_node, only: [:destroy]
  before_action :set_noded, only: [:show]

  # GET /api/v2/nodes
  def index
    if params[:group_id].blank?
      render status: :unprocessable_entity, json: {status: "error", code: 422, message: "group_id is required"}
    else
      @nodes = Node.where(:group_id => params[:group_id])

      if @nodes.blank?
        render status: 200, json: {succes: {status: 200, message: 'No existen nodos asociados'}, data: @nodes}.to_json
      else
        render status: 200, json: {succes: {status: 200}, data: @nodes}.to_json
      end
    end
  end

  # GET /api/v2/nodes/1
  def show
    if @nodes.empty?
      render status: 404, json: {error: {status: 404, message: "El grupo con id=#{params[:id]} no tiene nodos asociados"}}.to_json
    else
      array = []
      @nodes.each do |node|
        array.push({'node': node,'sensors': node.sensors})
      end
      render status: 200, json: {succes: {status: 200}, data: array}.to_json
    end
  end

  # POST /api/v2/nodes
  def create
    @node = Node.new(:modelName => params[:modelName], :manufacterName => params[:manufacterName], :description => params[:description],:group_id => params[:group_id])
    params[:sensors].each do |item|
      sensor = Sensor.find_by_id(item[:id])
      if sensor.nil?
        puts "Sensor no existe"
      else
        @node.sensors << sensor
      end
    end
    if @node.save
      render status: 201, json: {succes: {status: 201, message: 'Nodo creado'}, data: @node}.to_json
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end


  # DELETE /api/v2/nodes/1
  def destroy
    sensors = @node.sensors
    @node.sensors.delete(sensors)
    @node.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_node
      @node = Node.find_by_id(params[:id])
    end

    def set_nodes
      @nodes = Node.where(:group_id => params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def node_params
      params.fetch(:node, {})
    end
end
