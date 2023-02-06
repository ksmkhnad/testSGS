<template>
  <div>
    <label for="city">Город:</label>
    <select id="city" v-model="selectedCity">
      <option v-for="city in cities" :key="city">{{ city }}</option>
    </select>
    <br />
    <label for="department">Цех:</label>
    <select id="department" v-model="selectedDepartment">
      <option v-for="department in departments" :key="department">
        {{ department }}
      </option>
    </select>
    <br />
    <label for="employee">Сотрудник:</label>
    <select id="employee" v-model="selectedEmployee">
      <option v-for="employee in employees" :key="employee">
        {{ employee }}
      </option>
    </select>
    <br />
    <label for="team">Бригада:</label>
    <select id="team" v-model="selectedTeam">
      <option v-for="team in teams" :key="team">{{ team }}</option>
    </select>
    <br />
    <label for="shift">Смена:</label>
    <select id="shift" v-model="selectedShift">
      <option v-for="shift in shifts" :key="shift">{{ shift }}</option>
    </select>
    <br />
    <button @click="submitForm">Сохранить</button>
  </div>
</template>

<script>
export default {
  name: "App",
  components: {},
  data() {
    return {
      selectedCity: "",
      selectedDepartment: "",
      selectedEmployee: "",
      selectedTeam: "",
      selectedShift: "",
      cities: ["Алматы", "Астана"],
      departments: [],
      employees: [],
      teams: ["Бригада1", "Бригада2"],
      shifts: ["Утренний", "Вечерний"],
    };
  },
  watch: {
    selectedCity(newValue) {
      if (newValue === "Алматы") {
        this.departments = ["цех1", "цех3", "цех4"];
      } else if (newValue === "Астана") {
        this.departments = ["цех2", "цех5", "цех6"];
      }
    },
    selectedDepartment(newValue) {
      if (newValue === "цех1") {
        this.employees = ["сотрудник1", "сотрудник2", "cотрудник3"];
      } else if (newValue === "цех3") {
        this.employees = ["сотрудникр6", "сотрудник5", "cотрудник9"];
      }
    },
  },
  methods: {
    submitForm() {
      const formData = {
        selectedCity: this.selectedCity,
        selectedDepartment: this.selectedDepartment,
        selectedEmployee: this.selectedEmployee,
        selectedTeam: this.selectedTeam,
        selectedShift: this.selectedShift,
      };
      const formDataJSON = JSON.stringify(formData);
      document.cookie = `formData=${formDataJSON}; expires=Thu, 18 Dec 2030 12:00:00 UTC; path=/;`;
      console.log(document.cookie);
    },
  },
};
</script>

<style>
h1 {
  text-align: center;
  font-family: "Times New Roman", Times, serif;
  font-style: normal;
}
select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
input[type="submit"] {
  width: 100%;
  background-color: #4caf50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
