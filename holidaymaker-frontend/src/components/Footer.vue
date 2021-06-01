<template>
  <footer>
    <div class="footer-parent">
      <div class="footer-div1">
          <p>© HolidayMaker 2021</p>
      </div>
      <div class="footer-div2">
          <span>
            <router-link class="link" to="/"> Home </router-link> |
            <router-link class="link" to="/about"> About Us </router-link> |
            <router-link class="link" to="/help"> Help/FAQ </router-link> |
            <router-link class="link" to="/contact"> Contact </router-link>
          </span>
      </div>
      <div class="footer-div3">
          <p>App created with <a href="https://vuejs.org/" target="blank">Vue</a>.</p>  
      </div>
    </div>
  </footer>
</template>

<script>
export default {

}
</script>

<style>

footer {
  background:rgb(233, 232, 253);
}

.footer-parent {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 1fr;
  padding-top: 20px;
  margin-bottom: 0px;
}
.footer-div1 { 
  grid-area: 1 / 1 / 2 / 2; 
  text-align: left;
  margin-left: 20px;
  font-weight: bold;
}
.footer-div2 { 
  grid-area: 1 / 2 / 2 / 3; 
  text-align: center;
}

.footer-div3 { 
  grid-area: 1 / 3 / 2 / 4; 
  text-align: right;
  margin-right: 30px;
  font-style: italic;
}

.link {
  color: lightcoral;
}

.link:hover {
  color:lightpink;
}

</style>