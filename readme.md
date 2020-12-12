### CFVue

A quick example of using Vue with ColdFusion.

The current example grabs JSON data from Typicode.com

https://jsonplaceholder.typicode.com/users

https://jsonplaceholder.typicode.com/posts

The data is grabbed using CFHTTP when the page loads and is strapped to the page by serializing the data as JSON and stored to a js variable. When Vue is initialized the data elements are initialized using the js variables in window.jsData. Once that is done the page is rendered using VueJS.

