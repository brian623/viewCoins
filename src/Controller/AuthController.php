<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Serializer\SerializerInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\String\ByteString;
use Symfony\Component\String\UnicodeString;

class AuthController extends AbstractController
{
    private $userRepository;
    private $security;
    private $serializerInterface;
    private $entityManager;
    
    public function __construct(
        UserRepository $userRepository,
        Security $security,
        SerializerInterface $serializerInterface,
        EntityManagerInterface $entityManager
    ){
        $this->userRepository = $userRepository;
        $this->security = $security;
        $this->serializerInterface = $serializerInterface;
        $this->entityManager = $entityManager;
    }

    #[Route('/', name: 'homepage')]
    public function init()
    {
        return $this->redirectToRoute('login');
    }


    #[Route('/register', name: 'register')]
    public function register(Request $request): JsonResponse
    {
        $jsonData= json_decode($request->getContent());
        $user = $this->userRepository->addUser($jsonData);
        return new JsonResponse([
            'msg' => 'registro exitoso',
            'user' => $this->serializerInterface->serialize($user,'json'),
        ],201);
    }


    #[Route('/edit/{id}', name: 'edit')]
    public function edit(Request $request): JsonResponse
    {
        $user = $this->getUser();
    
        // Obtener los datos enviados en el formulario
        $image = $request->request->get('image');
        $name = $request->request->get('name');
        $email = $request->request->get('email');
        
        if ($image) {
            $user->setImage($image);
        }
        if ($name) {
            $user->setName($name);
        }
        if ($email) {
            $user->setName($email);
        }
        
        // Guardar los cambios en la base de datos
        $this->entityManager->persist($user);
        $this->entityManager->flush();
        
        // Responder con una respuesta JSON
        return new JsonResponse([
            'msg' => 'User updated successfully',
            'user' => $this->serializerInterface->serialize($user,'json'),
        ],200);
    }

    #[Route('/api/login', name: 'login')]
    public function index(): Response
    {
        return $this->json([
            'message' => 'sucess',
        ]);
    }

    #[Route('/getUser', name: 'getUser')]
    public function user(): JsonResponse
    {
        $user = $this->security->getUser();
        $dataUser = $this->serializerInterface->serialize($user, 'json');
        return new JsonResponse([
            $dataUser,
        ],200);
    }

    #[Route('/logout', name: 'logout')]
    public function logout(): JsonResponse
    {
        return new JsonResponse([
            'msg' => 'ha cerrado sesión'
        ]);
    }
}
