Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'tops#index'

  get 'terms_of_service', to: 'terms_of_service#show'
  get 'privacy_policy', to: 'privacy_policy#show'

  # システム管理者用画面
  namespace :admin, path: 'aaaaaaaa' do
    root to: 'schools#index', as: 'root'

    devise_for :admins,
               only: %i[session password],
               controllers: { passwords: 'admins/passwords',
                              sessions: 'admins/sessions' }
    resources :schools do
      resources :teachers, param: :code, only: %i[show new create edit update]
    end
  end

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # マルチテナントの切り分け
  scope '/:school_code' do
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    # 教師用画面
    namespace :teacher, path: 't' do
      root to: 'students#index', as: 'root'

      devise_for :teachers,
                 only: %i[session password],
                 controllers: { passwords: 'teachers/passwords',
                                sessions: 'teachers/sessions' }
                                
      resources :students, only: %i[index edit update show destroy]
      resources :test_results, only: %i[index edit update show destroy] do
        collection do
          get :subject_achievement_rate
        end
      end
    end

    # 生徒用画面
    scope module: :student do
      root to: 'test_results#index', as: 'student_root'

      devise_for :students,
                 only: %i[session password registration confirmation],
                 controllers: { passwords: 'students/passwords',
                                sessions: 'students/sessions',
                                registrations: 'students/registrations',
                                confirmations: 'students/confirmations' }
      resources :test_results, except: [:show] do
        collection do
          get :subject_achievement_rate
        end
      end
    end
  end
end
