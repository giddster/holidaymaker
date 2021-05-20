<template>
<!-- - return available hotels based on given date and amount of guests (iterate with v-for)
    -in available hotels:
            - icons for bools
            - review average
            - star rating
            - thumbnail pic
- "book now" button for each hotel option
- filter component -->
<div>
    <ul>
        <li v-for="destination in destinations" :key="destination.country">
            City: {{destination.city}}
            Country: {{destination.country}}
        </li>
    </ul>
    <section v-for="destination in destinations" :key="destination.country">
        {{destination.country}}
    </section>
</div>
</template>

<script>
export default {
computed: {
    destinations(){
        return this.$store.state.destinations[this.$route.params.category];
    }
}
}
</script>