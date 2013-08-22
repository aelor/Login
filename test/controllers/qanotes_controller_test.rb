require 'test_helper'

class QanotesControllerTest < ActionController::TestCase
  setup do
    @qanote = qanotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qanotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qanote" do
    assert_difference('Qanote.count') do
      post :create, qanote: { clientdetail: @qanote.clientdetail, currenttag: @qanote.currenttag, date: @qanote.date, developername: @qanote.developername, diff1: @qanote.diff1, diff2: @qanote.diff2, gatekeeper: @qanote.gatekeeper, oldtag: @qanote.oldtag, patchnamedetail: @qanote.patchnamedetail, productname: @qanote.productname, projectname: @qanote.projectname, servername: @qanote.servername, signature: @qanote.signature, tasknodetail: @qanote.tasknodetail, testedby: @qanote.testedby, uploadedfromtag: @qanote.uploadedfromtag }
    end

    assert_redirected_to qanote_path(assigns(:qanote))
  end

  test "should show qanote" do
    get :show, id: @qanote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qanote
    assert_response :success
  end

  test "should update qanote" do
    patch :update, id: @qanote, qanote: { clientdetail: @qanote.clientdetail, currenttag: @qanote.currenttag, date: @qanote.date, developername: @qanote.developername, diff1: @qanote.diff1, diff2: @qanote.diff2, gatekeeper: @qanote.gatekeeper, oldtag: @qanote.oldtag, patchnamedetail: @qanote.patchnamedetail, productname: @qanote.productname, projectname: @qanote.projectname, servername: @qanote.servername, signature: @qanote.signature, tasknodetail: @qanote.tasknodetail, testedby: @qanote.testedby, uploadedfromtag: @qanote.uploadedfromtag }
    assert_redirected_to qanote_path(assigns(:qanote))
  end

  test "should destroy qanote" do
    assert_difference('Qanote.count', -1) do
      delete :destroy, id: @qanote
    end

    assert_redirected_to qanotes_path
  end
end
