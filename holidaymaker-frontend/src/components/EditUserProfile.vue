<template>
    <div class="editProfile-page">
        <div class="form">
            <form class="editProfile-Form">
                <h5 class="profile-form-title">Edit your profile</h5>
                <input type="text" placeholder="Email">
                <input type="text" placeholder="Password">
                <input type="text" placeholder="Name">
                <input type="text" placeholder="Lastname">
                <button class="btn btn-lg btn-primary saveprofilechanges-button">Save changes</button>
            </form>
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>
.form input{
    font-family: "Roboto", sans-serif;
    outline:1;
    width:100%;
    border:0;
    margin:0 0 15px;
    padding: 10px;
    font-size: 14px;
    border-style: solid;
    border-width: 1px;
    
}
.profile-form-title {
    margin-bottom: 20px;
}
.form {
    background: rgb(246, 246, 252);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
    border-style: solid;
    border-width: 1px;
    border-radius: 10px;
}
.editProfile-page{
    width:360px;
    margin: auto;
}

.saveprofilechanges-button {
    background: lightcoral;
    border-radius: 5px;
    border: 1px solid lightcoral;
}

.saveprofilechanges-button:hover {
    background: rgb(245, 106, 106)
}
</style>