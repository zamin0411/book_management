require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET index' do
    # before { allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil } }
    it 'assigns @books' do
      book = create(:book)
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET show' do
    it 'assigns @book' do
      book = create(:book)
      get :show, params: { id: book.id }
      expect(assigns(:book)).to eq(book)
    end

    it 'renders the show template' do
      book = create(:book)
      get :show, params: { id: book.id }
      expect(response).to render_template('show')
    end

    it 'returns http success' do
      book = create(:book)
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET new' do
    it 'assigns @book' do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
      expect(assigns(:book)).to be_an_instance_of(Book)
      expect(assigns(:book)).to be_a_kind_of(Book)
    end

    it'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
