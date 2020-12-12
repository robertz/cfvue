<cfoutput>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>HTML5 Template</title>
    <meta name="description" content="HTML5 Template">
    <meta name="author" content="demo">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://unpkg.com/vue"></script>
    <link rel="stylesheet" href="css/styles.css?v=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
</head>
<body>
    <cfscript>
        cfhttp(url = "https://jsonplaceholder.typicode.com/users");
        users = deserializeJSON(cfhttp.fileContent);
        cfhttp(url = "https://jsonplaceholder.typicode.com/posts");
        posts = deserializeJSON(cfhttp.fileContent);
    </cfscript>
    
    <div id="app">
        <table class="table is-fullwidth is-bordered is-striped is-narrow">
            <thead>
                <tr>
                    <th>Author</th>
                    <th>Title</th>
                    <th width="50%">Body</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="post in posts">
                    <td>{{ post.userId | getUser(users) }}</td>
                    <td>{{ post.title }}</td>
                    <td>{{ post.body }}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <script>
        window.jsData = {};
        window.jsData['users'] = #serializeJSON(users)#;
        window.jsData['posts'] = #serializeJSON(posts)#;
    </script>

    <script>
        new Vue({
            el: "##app",
            data() {
                return {
                    users: window.jsData.users || [],
                    posts: window.jsData.posts || []
                }
            },
            filters: {
               getUser: function (userId, users) {
                    return users.filter(user => {
                        return user.id === userId
                    })[0].name
               } 
            }
        })
    </script>
</body>
</html>
</cfoutput>