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
            
                <ValidationProvider rules="required" name="Name">
                    <b-form-group id="input-group-2" label="Nombre:" label-for="input-2" slot-scope="{valid , errors}">
                        <b-form-input
                            id="input-2"
                            v-model="form.name"
                            :state="errors[0] ? false : (valid ? true : null)"
                            placeholder="ingrese nombre"
                            required
                        ></b-form-input>
                        <b-form-valid-feedback id="input-2-live-feedback">
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

                <ValidationProvider rules="required|confirmed:password" name="Confirm Password">
                    <b-form-group id="input-group-4" label="Confirme Contraseña:" label-for="input-4" slot-scope="{valid , errors}">
                        <b-form-input
                            id="input-4"
                            v-model="form.password_confirmation"
                            :state="errors[0] ? false : (valid ? true : null)"
                            placeholder="ingrese contraseña"
                            type="password"
                            required
                        ></b-form-input>
                        <b-form-valid-feedback id="input-4-live-feedback">
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
    name: "Register",
    data() {
        return {
            form: {
                email: "",
                name: "",
                password: "",
                password_confirmation: ""
            },
        };
    },
    methods: {
        ...mapActions({
            register: 'auth/register'
        }),
        handleSubmit() {
            let dataForm = {
                'name': this.form.name,
                'email': this.form.email,
                'password': this.form.password
            }

            this.register(dataForm)
            .then(()=> {
                console.log('Finalizado')
            }).catch((e) => {
                console.log(error)
            })       
        },
    },
    components: { ValidationObserver, ValidationProvider }
}
</script>