require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url, as: :json
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { business_id: @category.business_id, nameAr: @category.nameAr, nameEn: @category.nameEn, position: @category.position } }, as: :json
    end

    assert_response 201
  end

  test "should show category" do
    get category_url(@category), as: :json
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { business_id: @category.business_id, nameAr: @category.nameAr, nameEn: @category.nameEn, position: @category.position } }, as: :json
    assert_response 200
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category), as: :json
    end

    assert_response 204
  end
end
