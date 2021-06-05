<template>
    <div class="destinations" v-for="destination in destinations" :key="destination.id">
        <h3>Country: {{destination.country}}</h3>
        <p>City: {{destination.city}}</p>
        <i>Description: Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit adipisci est nesciunt temporibus dolores accusantium et, animi placeat! Repudiandae expedita ex optio velit molestias eum ullam! Obcaecati quasi maxime tenetur. </i>
    </div>
</template>

<script>
export default {
computed: {
    destinations(){
        return this.$store.state.destinations
    }
}
}
</script>

<style>
.destinations{
    margin: 15px auto;
    padding: 10px;
    background: rgb(246, 246, 252);
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.26);
    max-width: 50%;
    display: flex;
}
</style>