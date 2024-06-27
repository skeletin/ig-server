class PostService
    def upload(current_user, post_params)
        post = current_user.posts.build(post_params)
        post.save
        return post
    end
end