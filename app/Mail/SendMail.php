<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;

class SendMail extends Mailable
{
    public $data;

    /**
     * Create a new message instance.
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     */
    public function build()
    {
        return $this->view('emails.demoMail')
                    ->with('data', $this->data);  // Ensure 'emails.send' view exists
    }
}
