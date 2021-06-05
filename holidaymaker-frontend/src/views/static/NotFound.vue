<template>
  <div class="notfound">
        <h1>Error 404 - Not Found</h1>
        <h4>Sorry, the page you were looking for was not found!</h4>
        <router-link to="/" class="btn btn-lg btn-primary">Back to homepage</router-link>
  </div>
  
</template>

<script>

export default {
name: 'NotFound',
}

</script>

<style scoped>
.notfound{
    text-align: center;
    margin-top: 100px;
}
</style>