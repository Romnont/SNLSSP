using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public CharacterController characterController;
    public float speed = 6;



    // Start is called before the first frame update
    void Start()
    {
        
    }



    // Update is called once per frame
    void Update()
    {
        Move();
    }

    private void Move()
    {
        float horizontalMove = Input.GetAxis("Horizontal");
        float verticalMove = Input.GetAxis("Vertical");

        Vector3 move = transform.forward * verticalMove + transform.right * horizontalMove;
        characterController.Move(speed * Time.deltaTime * move);
    }

}
