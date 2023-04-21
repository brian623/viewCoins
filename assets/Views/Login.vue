<template>
    <b-container fluid="sm" class="my-5">
        <ValidationObserver ref="observer">
            <b-form slot-scope="{validate, valid, errors}" @submit.prevent="validate().then(handleSubmit)">
                <ValidationProvider rules="required" name="Email">
                    <b-form-group
                        slot-scope="{valid , errors}"
                        id="input-group-1"
                        label="Email:"
                        label-for="input-1"
                        description=""
                        >
                        <b-form-input
                            id="input-1"
                            v-model="form.email"
                            :state="errors[0] ? false : (valid ? true : null)"
                            type="email"
                            placeholder="ingrese email"
                            required
                        ></b-form-input>
                        <b-form-valid-feedback id="input-1-live-feedback">
                            {{ errors[0] }}
                        </b-form-valid-feedback>
                    </b-form-group>
                </ValidationProvider>

                <ValidationProvider rules="required" name="Password" vid="password">
                    <b-form-group id="input-group-3" label="Contraseña:" label-for="input-3" slot-scope="{valid , errors}">
                        <b-form-input
                            id="input-3"
                            v-model="form.password"
                            :state="errors[0] ? false : (valid ? true : null)"
                            placeholder="ingrese contraseña"
                            type="password"
                            required
                        ></b-form-input>
                        <b-form-valid-feedback id="input-3-live-feedback">
                            {{ errors[0] }}
                        </b-form-valid-feedback>
                    </b-form-group>
                </ValidationProvider>

                <b-button type="submit" variant="primary">Submit</b-button>
            </b-form>
        </ValidationObserver>
    </b-container>
</template>
  
<script>
import { ValidationObserver, ValidationProvider } from 'vee-validate';
import { mapGetters, mapActions } from "vuex";

export default {
    name: "Login",
    data() {
        return {
            form: {
                email: "",
                password: "",
            },
        };
    },
    methods: {
        ...mapActions({
            login: 'auth/login'
        }),
        handleSubmit() {
            let dataForm = {
                'email': this.form.email,
                'password': this.form.password
            }

            this.login(dataForm)
            .finally(()=> {
                console.log('session init')
                this.$router.replace({'name': 'Dashboard'})
            }).catch((e) => {
                console.log(e)
            })       
        },
    },
    components: { ValidationObserver, ValidationProvider }
}
</script>