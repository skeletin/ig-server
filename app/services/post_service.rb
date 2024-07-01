class PostService
    def upload(current_user, post_params)
        @post = current_user.posts.build(post_params)
        @post.save
        Api::V1::PostSerializer.new(@post)
    end

    def user_posts(params)
       user = User.find_by(username: params[:username])
       posts = user.posts
       ActiveModel::SerializableResource.new(posts, each_serializer: Api::V1::PostSerializer)
    end

    def get_post(params)
        post = Post.find(params[:id])
        Api::V1::PostSerializer.new(post)
    end
end