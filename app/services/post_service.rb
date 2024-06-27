class PostService
    def upload(current_user, post_params)
        @post = current_user.posts.build(post_params)
        @post.save
        return Api::V1::PostSerializer.new(@post)
    end
end