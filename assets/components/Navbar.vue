<template>
    <div>
        <b-navbar type="dark" variant="dark">
            <b-navbar-nav left>
            <b-nav-item href="/view#/dashboard">Dashboard</b-nav-item>

            <!-- Navbar dropdowns -->
            <b-nav-item-dropdown text="User" right>
                <b-dropdown-item href="/view#/login">Login</b-dropdown-item>
                <b-dropdown-item href="/view#/registro">Registro</b-dropdown-item>
                <b-dropdown-item href="/view#/edit">Editar Perfil</b-dropdown-item>
            </b-nav-item-dropdown>
            </b-navbar-nav>
        </b-navbar>
    </div>
</template>