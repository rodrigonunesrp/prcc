class UserService
    def initialize(params)
        @user_params = params[:user]
    end
    
    def perform
        @user = User.new(@user_params)
        if @user.save
            { valid: true, user: @user }
        else 
            raise ActiveRecord::ActiveRecordError
        end
    rescue ActiveRecord::ActiveRecordError
        { valid: false, error: @user.errors.full_messages }
    rescue StandardError => e
        { valid: false, error: e }
    end

    private

end