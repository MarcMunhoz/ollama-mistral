<template>
  <div class="w-full mx-5">
    <q-input v-model="text" filled type="textarea" />
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";

const text = ref();
</script>
