<template>
<footer>
    <div class="container-fluid" id="footerContainer">
        <div class="row"> 
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4" id="leftFooterDiv">
                        <p>© HolidayMaker 2021</p>
                    </div>

                    <div class="col-md-4" id="middleFooterDiv">
                        <nav>
                            <router-link to="/"> Home </router-link> |
                            <router-link to="/help"> Help/FAQ </router-link> |
                            <router-link to="/about"> About </router-link> |
                            <router-link to="/contact"> Contact </router-link>
                        </nav>
                    </div>

                    <div class="col-md-4" id="rightFooterDiv">
                        <p>App created with <a href="https://vuejs.org/" target="blank">Vue</a>.</p>
                    </div>

                </div>
            </div>
        </div>
</div>
</footer>
</template>

<script>

export default{
    
}

</script>