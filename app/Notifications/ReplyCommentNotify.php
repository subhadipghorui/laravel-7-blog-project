<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ReplyCommentNotify extends Notification implements ShouldQueue
{
    use Queueable;
    public $replyComment;

    /**
     * Create a new notification instance.
     */
    public function __construct($replyComment)
    {
        $this->replyComment = $replyComment;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     *
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     *
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage())
        ->subject('Re: '. $this->replyComment->comment->message)
        ->greeting('Post : '.$this->replyComment->comment->post->title)
        ->line('User : '.$this->replyComment->user->name)
        ->line('Comment : '.$this->replyComment->message)
        ->action('View Post', url(route('post', $this->replyComment->comment->post->slug)))
        ->line('Thank you.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
