using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{


    // Start is called before the first frame update
    public float moveSpeed = 2f;
    public float maxSpeed = 5f;


    public float contador = 0f;
    Transform thistrans;
    private Rigidbody rb3d;
    private Animator anim;
    private SpriteRenderer spr;
    private PolygonCollider2D box;
    private bool jump;
    private bool doublejump;
    private bool movement = true;

    private GameObject lifebar;
    AudioSource Fuente, CamaraSound;


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void FixedUpdate()
    {


        Vector3 fixedVelocity = rb3d.velocity;
        fixedVelocity.x *= 0.75f;



        float h = Input.GetAxisRaw("Horizontal");
        if (!movement) h = 0;

        rb3d.AddForce(Vector2.right * moveSpeed * h);
        float LimitedSpeed = Mathf.Clamp(rb3d.velocity.x, -maxSpeed, maxSpeed);
        rb3d.velocity = new Vector2(LimitedSpeed, rb3d.velocity.y);

        if (h > 0.1f)
        {
            transform.localScale = new Vector3(1f, 1f, 1f);
        }

        if (h < -0.1f)
        {
            transform.localScale = new Vector3(-1f, 1f, 1f);
        }

    }
}
