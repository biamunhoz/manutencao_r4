require 'test_helper'

class InformativoObrasControllerTest < ActionController::TestCase
  setup do
    @informativo_obra = informativo_obras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:informativo_obras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create informativo_obra" do
    assert_difference('InformativoObra.count') do
      post :create, informativo_obra: { andar: @informativo_obra.andar, building_id: @informativo_obra.building_id, cnpjemp: @informativo_obra.cnpjemp, contratante: @informativo_obra.contratante, department_id: @informativo_obra.department_id, descricao: @informativo_obra.descricao, email: @informativo_obra.email, foneemergencia: @informativo_obra.foneemergencia, foneemp: @informativo_obra.foneemp, intervencaologica: @informativo_obra.intervencaologica, intervencaotelefonia: @informativo_obra.intervencaotelefonia, laboratorio: @informativo_obra.laboratorio, local: @informativo_obra.local, nomeemergencia: @informativo_obra.nomeemergencia, nomeemp: @informativo_obra.nomeemp, origemrecurso: @informativo_obra.origemrecurso, previnicio: @informativo_obra.previnicio, prevtermino: @informativo_obra.prevtermino, ramal: @informativo_obra.ramal, responsavelemp: @informativo_obra.responsavelemp, rgemp: @informativo_obra.rgemp, usuario_id: @informativo_obra.usuario_id }
    end

    assert_redirected_to informativo_obra_path(assigns(:informativo_obra))
  end

  test "should show informativo_obra" do
    get :show, id: @informativo_obra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @informativo_obra
    assert_response :success
  end

  test "should update informativo_obra" do
    patch :update, id: @informativo_obra, informativo_obra: { andar: @informativo_obra.andar, building_id: @informativo_obra.building_id, cnpjemp: @informativo_obra.cnpjemp, contratante: @informativo_obra.contratante, department_id: @informativo_obra.department_id, descricao: @informativo_obra.descricao, email: @informativo_obra.email, foneemergencia: @informativo_obra.foneemergencia, foneemp: @informativo_obra.foneemp, intervencaologica: @informativo_obra.intervencaologica, intervencaotelefonia: @informativo_obra.intervencaotelefonia, laboratorio: @informativo_obra.laboratorio, local: @informativo_obra.local, nomeemergencia: @informativo_obra.nomeemergencia, nomeemp: @informativo_obra.nomeemp, origemrecurso: @informativo_obra.origemrecurso, previnicio: @informativo_obra.previnicio, prevtermino: @informativo_obra.prevtermino, ramal: @informativo_obra.ramal, responsavelemp: @informativo_obra.responsavelemp, rgemp: @informativo_obra.rgemp, usuario_id: @informativo_obra.usuario_id }
    assert_redirected_to informativo_obra_path(assigns(:informativo_obra))
  end

  test "should destroy informativo_obra" do
    assert_difference('InformativoObra.count', -1) do
      delete :destroy, id: @informativo_obra
    end

    assert_redirected_to informativo_obras_path
  end
end
