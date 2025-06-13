<template>
  <div class="w-full mx-[2em]">
    <q-input v-model="text" filled type="textarea" />
    <q-btn :loading="loading" color="red" @click="simulateProgress">
      Button
      <template v-slot:loading> Loading... </template>
    </q-btn>

    <section id="mistral-response" class="mt-4">
      <p>{{ mistralResponse }}</p>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import axios from "axios";

const text = ref("");
const loading = ref(false);
const mistralResponse = ref("");

const simulateProgress = async () => {
  loading.value = true;
  mistralResponse.value = "";

  try {
    const { data } = await axios.post("/api/mistral/comment", {
      text: text.value,
    });

    mistralResponse.value = data.comment || "No response";
  } catch (err) {
    if (axios.isAxiosError(err)) {
      mistralResponse.value = "Erro: " + (err.response?.data?.error || err.message);
    } else {
      mistralResponse.value = "Erro inesperado: " + String(err);
    }
    console.error("❌ Erro na requisição:", err);
  }
};
</script>
