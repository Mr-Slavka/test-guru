
  class Admin::BadgesController < Admin::BaseController
    before_action :set_badge, only: %i[show edit update destroy]
    before_action :set_author, only: %i[new create]

    def index
      @badges = Badge.where(author_id: current_user.id)
    end

    def show; end

    def new
      @badge = Badge.new
    end

    def edit; end

    def create
      @badge = @author.created_badges.build(badge_params)

      if @badge.save
        redirect_to admin_badges_path
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy

      redirect_to admin_badges_path
    end

    private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def set_author
      @author = current_user
    end

    def badge_params
      params.require(:badge).permit(:title, :image, :rule, :rule_options)
    end
  end
