<template>
    <b-container fluid="sm" class="my-5">
        <b-form  @submit.prevent="handleSubmit()" enctype="multipart/form-data">
                <b-form-group
                    id="input-group-1"
                    label="Email:"
                    label-for="input-1"
                    description=""
                    >
                    <b-form-input
                        id="input-1"
                        v-model="form.email"
                        type="email"
                        placeholder="ingrese email"
                        required
                    ></b-form-input>
                </b-form-group>

                <b-form-group id="input-group-2" label="Nombre:" label-for="input-2">
                    <b-form-input
                        id="input-2"
                        v-model="form.name"
                        placeholder="ingrese nombre"
                        required
                        value: user.name
                    ></b-form-input>
                </b-form-group> 

                <b-form-group id="input-group-3" label="Imagen de Perfil:" label-for="input-3">
                    <b-form-file
                        v-model="image"
                        :state="Boolean(image)"
                        placeholder="Choose a file or drop it here..."
                        drop-placeholder="Drop file here..."
                        ></b-form-file>
                    <div class="mt-3">Selected file: {{ image ? image.name : '' }}</div>
                </b-form-group>
            <b-button type="submit" variant="primary">Submit</b-button>
        </b-form>
    </b-container>
</template>
  
<script>
import { mapGetters, mapActions } from "vuex";

export default {
    name: "Register",
    computed: {
        ...mapGetters({
            user: "auth/getUser",
        }),
    },
    data() {
        return {
            form: {
                email: "",
                name: "",
                imagePath: null                
            },
            image: null,
        };
    },
    watch: {
        image: function (newVal, oldVal) {
            if(newVal) {
                this.createBase64Image(newVal);
            } else {
                this.imagePath = oldVal;
            }
        }
    },
    methods: {
        createBase64Image: function(FileObject) {
            const reader = new FileReader();
            reader.onload = (event) => {
                this.imagePath = event.target.result;
                console.log(this.imagePath);
            }
            reader.readAsDataURL(FileObject);
        },
        ...mapActions({
            edit: 'auth/edit'
        }),
        handleSubmit() { 
            console.log(this.imagePath);          
            let dataForm = {
                'id': this.user.id,
                'name': this.form.name,
                'email': this.form.email,
                'image': this.imagePath
            }
            console.log(dataForm);
            this.edit(dataForm)
            .finally(()=> {
                this.$router.replace({'name': 'Dashboard'})
            }).catch((error) => {
                console.log(error)
            })       
        },        
    },
}
</script>